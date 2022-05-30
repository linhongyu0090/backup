//
//  ViewController.swift
//  Demo
//
//  Created by 沈欢 on 2021/11/30.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
    }


    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        serialQueueAsync()
//        concurrentQueueAsync()
//        groupConcurrence()
    }
    
    
}



extension ViewController {
    
    //MARK: - 串行队列 + 异步
    ///- 串行队列的异步会开启新线程，之后在新线程中执行该异步任务，因此**当前任务不会因该异步任务产生等待**
    ///- 但是因为该队列里的任务是串行的，执行完一个任务，再执行下一个任务。所以该异步任务会在当前任务完成之后才执行。
    ///- 不准确地，可以理解为暂时跳过该异步任务，接着执行之后的任务，之后的任务执行完毕之后再执行该异步操作
    func serialQueueAsync() {
        NSLog("currentThread---%@",Thread.current)
        
        NSLog("asyncSerial---begin")
        
        let serialQueue = DispatchQueue(label: "com.demo.serialQueue")
        
        
        // 追加任务1   异步
        serialQueue.async {
            sleep(2) // 模拟耗时操作
            NSLog("1---%@",Thread.current)
        }
        
        // 追加任务2   异步
        serialQueue.async {
            sleep(2)
            NSLog("2---%@",Thread.current)
        }
        
        // 追加任务3   异步
        serialQueue.async {
            sleep(2)
            NSLog("3---%@",Thread.current)
        }
        
        
        NSLog("asyncSerial---end");
    }
    
    
    //MARK: -  并发队列 + 异步
    func concurrentQueueAsync() {
        NSLog("currentThread---%@",Thread.current)
        
        NSLog("asyncConcurrent---begin")
        
        let concurrentQueue = DispatchQueue(label: "com.demo.concurrentQueue", qos: .default , attributes: .concurrent)
        

        // 追加任务1   异步
        concurrentQueue.async {
            sleep(2) // 模拟耗时操作
            NSLog("1---%@",Thread.current)
        }
        
        // 追加任务2   异步
        concurrentQueue.async {
//            sleep(2)
            NSLog("2---%@",Thread.current)
        }
        
        // 追加任务3   异步
        concurrentQueue.async {
            sleep(2)
            NSLog("3---%@",Thread.current)
        }
        
        sleep(1)
        NSLog("asyncConcurren---end");
    }
    
    
    //MARK: - 组并发
    func groupConcurrence() {
        NSLog("currentThread---%@",Thread.current)
        
        NSLog("asyncConcurrent---begin")
        
        let group = DispatchGroup()

        let concurrentQueue = DispatchQueue(label: "com.demo.concurrentQueue", qos: .default , attributes: .concurrent)

        // 追加任务1   异步
        group.enter()
        concurrentQueue.async {
            sleep(2) // 模拟耗时操作
            NSLog("1---%@",Thread.current)
            group.leave()
        }
        
        // 追加任务2   异步
        group.enter()
        concurrentQueue.async {
            sleep(2)
            NSLog("2---%@",Thread.current)
            group.leave()
        }
        
        // 追加任务3   异步
        group.enter()
        concurrentQueue.async {
            sleep(2)
            NSLog("3---%@",Thread.current)
            group.leave()
        }
        
        //监听该队列组是否全部执行完毕
        group.notify(queue: .main) {
            NSLog("asyncConcurren---end");
        }
        
    }
    
}
