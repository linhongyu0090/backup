[TOC]



## iOS多线程GCD

>  **Grand Central Dispatch（GCD）** 是 Apple 开发的一个多核编程的较新的解决方法。它主要用于优化应用程序以支持多核处理器以及其他对称多处理系统。它是一个在线程池模式的基础上执行的并发任务。
>
> ​	多线程最常用于耗时操作（如网络请求、沙盒文件的读写）。为了不阻塞主线程，通常将耗时操作放在子线程里，等该操作结束之后，才在主线程处理结果（如把数据展示在页面上）。
>
> ​	GCD内容十分丰富，本篇博客只对常用的几个知识点加以概括并举例。



### 任务

> **任务**：就是执行操作的意思，换句话说就是你在线程中执行的那段代码。在 GCD 中是放在 block 中的。

执行任务有两种方式：**同步执行** 和 **异步执行**。

- 异步执行**async**
  - 该异步任务会添加到队列中，但**不会等待**该异步任务执行结束，而是会接着执行该异步任务之后的代码
  - 可以在新的线程中执行任务，具备开启新线程的能力（开启与否和队列类型有关）

- 同步执行**sync**
  - 该同步任务添加到队列中，且**会一直等待**该同步任务执行结束，然后才执行该同步任务之后的代码
  - 只能在当前线程中执行任务，不具备开启新线程的能力。



- 异步的应用场景

​	一段代码里面，有这么一部分操作，为了不影响当前任务的执行，对这部分操作采取异步执行，从而达到**先执行后面操作**的效果。

- 同步的应用场景

​	对于一些耗时任务，通常放在后台线程执行，因此主线程的代码并不会等待该耗时任务，而是接着执行该耗时任务之后的代码。但有的时候，**有些任务彼此之间有“依赖”关系**，比如必须前一个任务做完才能做后一个任务，那么就可以对前一个任务采取同步执行sync方式。



### 串行队列与并发队列

- 串行队列：只开启一个线程，一个任务执行完毕后，再执行下一个任务
- 并发队列：可以开启多个线程，并且同时执行任务（并发效果只有在异步方式下才有效）

![](https://upload-images.jianshu.io/upload_images/1877784-4faca27116209f35.png?imageMogr2/auto-orient/strip|imageView2/2/w/1200/format/webp)



![](https://upload-images.jianshu.io/upload_images/1877784-97f3931d1b187b11.png)





### swift如何创建队列

1. 自己创建队列

- 创建并发队列

`let concurrentQueue = DispatchQueue(label: "xxx", qos: .default , attributes: .concurrent)`

- 创建串行队列（不指定attributes就默认是串行队列）

`let serialQueue = DispatchQueue(label: "xxx")`



2. 用GCD默认提供的队列

- GCD提供的串行队列： **主队列**`DispatchQueue.main`

- GCD提供的并发队列：**全局并发队列** `DispatchQueue.global(qos: .default)`,qos是优先级，可选的有`default`、`background`等





### 异步 + 串行队列

```swift
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
```

结果是：

![](https://tva1.sinaimg.cn/large/008i3skNly1gwxg8o0n0fj30r302p750.jpg)

- 串行队列的异步会开启新线程，之后在新线程中执行该异步任务，因此**当前任务不会因该异步任务产生等待**

- 但是因为该队列里的任务是串行的，执行完一个任务，再执行下一个任务。所以该异步任务会在当前任务完成之后才执行。

- **可以不太准确地理解为暂时跳过该异步任务，接着执行之后的任务，之后的任务执行完毕之后再执行该异步操作**





### 异步 + 并发队列

```swift
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
```

其中一种结果是：

![](https://tva1.sinaimg.cn/large/008i3skNly1gwxjplfg89j30py02q0th.jpg)

“异步 + 并发队列”与“异步 + 串行队列”不同的是，这些异步任务可以并发执行，而不用一个执行完才接着执行另一个。本例中除了`currentThread---`和`asyncConcurrent---begin`会先输出，后四句的输出顺序其实是随机的，因为这几个任务是并发执行的。





### 组并发

> 在 iOS 开发过程中，我们一般在主线程里边进行 UI 刷新。我们通常把一些耗时的操作放在其他线程，比如说图片下载、文件上传等耗时操作。当我们需要同时异步执行**多个任务**，等这些任务**全部执行完毕时**，通过主线程利用该异步任务的结果，那么就可以用组并发。

> - `group.enter` 标志着一个任务追加到 group，执行一次，相当于 group 中未执行完毕任务数 +1
>
> - `group.leave` 标志着一个任务离开了 group，执行一次，相当于 group 中未执行完毕任务数 -1。
>
> - 当 group 中未执行完毕任务数为0的时候，才会使 `group.wait` 解除阻塞，以及**执行追加到 `group.notify` 中的任务。**

```swift
func groupConcurrence() {
    NSLog("currentThread---%@",Thread.current)

    NSLog("asyncConcurrent---begin")

    let group = DispatchGroup() //队列组

    let concurrentQueue = DispatchQueue(label: "com.demo.concurrentQueue", qos: .default , attributes: .concurrent) //并发队列

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
        //队列组group的任务全部结束之后，会执行notify里追加的任务
        NSLog("asyncConcurren---end");
 
    }
    // 注意：group.notify并不会阻塞在这边等待这些操作完成，所以这之后的代码仍然会正常执行
    ...
}
```

其中一种结果是：

![](https://tva1.sinaimg.cn/large/008i3skNly1gwxjp62mh8j30pz02jq3o.jpg)

该例与“异步 + 并发队列”中的例题不同的是：只有`1---`,`2---`,`3---`三句的输出顺序是随机的，`asyncConcurren---end`一定会在最后输出。





### 组并发的一个应用场景

> 首先请求第一个接口（url1），该接口会返回若干条动态。
>
> 接着**多次**请求第二个接口url2对这若干条动态都获取评论。
>
> 等这些请求全部完成之后，更新UI的相关数据。

```swift
//获取动态
//moments是网络请求得到的结果
request(url1) { moments in 
    let group = DispatchGroup()
               
    for moment in moments {
        group.enter()
        //为moment获取评论
        request(url2, parameter: moment.id) { comments in
            moment.comments += comments
            group.leave() //任务完成
        }
    }
    
    //全部请求都完成，会执行这里的操作
    group.notify(queue: .main) {
        self.tableView.reloadData()
    }
}
```



### 写在最后

​	我在实际开发中用同步用得相对较少，更多的是利用异步和并发队列来提升速度，所以本篇博客中介绍较少。~~下次一定~~把`信号量`、`锁`一同补上。

​	另外，2021年6月，苹果WWDC推出了Swift5.5，增加了一些并发的特性，其中就包括`async`、`await`，我将在下一篇博客中进行总结并与GCD作比较。

