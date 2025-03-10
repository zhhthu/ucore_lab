# Rerport: LAB2

计13，张宏辉，2011011237


##练习1：实现 first-fit 连续物理内存分配算法（需要编程）

1.设计实现过程

主要在源程序基础上实现default_pmm.c中的如下函数：

- default_init：无需修改。将nr_free置零即可
- default_init_memmap：已完成修改。需要对p进行SetPageProperty，并将list_add修改为list_add_before以保证访问列表时物理地址由小到大
- default_alloc_pages：已完成修改。线性扫描找到一个大小大于等于n的页之后，先利用原来的大block将空闲的插入正确的位置，再将大block删除，并且在分配页之后设置相应的reserved位。而大block如果有超过n的剩余部分，则剩余部分也作为一个block使用并标记。
- default_free_pages：已完成修改。线性扫描找到第一个基址比当前要释放的页的基址大的页，在插入的过程中对所插入页的flags进行修改，同时设置第一个插入页的property表示该block页数。关于相邻block的合并，如果后续页面的基址与当前插入的页面相邻，那么将这两个block合并。接着重新线性扫描，如果遇到一个页，以其开始的block正好与插入的block相邻则将两个block合并。

2.算法改进空间

利用高级数据结构能节约时间开销

##练习2：实现寻找虚拟地址对应的页表项（需要编程）

1.设计实现过程

实现请参见pmm.c的get_pte函数，流程如下：
- 找到一级页表入口，判断该一级页表项是否对应一个存在的二级页表；
- 如果不存在则创建一个，否则继续
  - 创建的时候如果create为false，则函数返回Null
  - 利用alloc_page函数分配一个物理页给二级页表
  - 将二级页表项链接到相应一级页表项并将二级页表清零
- 返回二级页表项的虚拟地址

2.请描述页目录项（Pag Director Entry）和页表（Page Table Entry）中每个组成部分的含义和以及对ucore而言的潜在用处

- PDE的前20位存储二级页表的基址，后三位标志位分别表示是否合法、是否可读写、用户访问权限
- PTE的前20位存储响应物理内存的基址，后三位标志位分别表示是否合法、是否可读写、用户访问权限
- 二级页面基址与物理内存基址便于操作系统的访问操作，而标志位便于操作系统的管理

3.如果ucore执行过程中访问内存，出现了页访问异常，请问硬件要做哪些事情？
- 硬件会产生缺页异常，跳到ucore指定的中断服务例程，等待操作系统的相应处理

##练习3：释放某虚地址所在的页并取消对应二级页表项的映射（需要编程）

1.设计实现过程

- 通过标志位判断该PTE是否合法，如果合法则释放
  - 利用pte2page函数得到相应的物理页
  - 将该页的ref减1，如果ref为0，利用free_page函数释放这个页
  - 将二级页表项清零
  - 利用tlb_invalidate函数将该表项从TLB中删除

2.数据结构Page的全局变量（其实是一个数组）的每一项与页表中的页目录项和页表项有无对应关系？如果有，其对应关系是啥？

- 有对应关系。数据结构Page的全局变量每一项对应了一个物理页，而每个物理页与逻辑地址或虚拟地址一一映射。

3.如果希望虚拟地址与物理地址相等，则需要如何修改lab2，完成此事？ 鼓励通过编程来具体完成这个问题

- 可以通过修改操作系统的段机制来实现。具体地说，在entry.S中取消段偏移，并在boot_map_segment函数中将映射方法实现为对等映射。
