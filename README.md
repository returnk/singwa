## tp5.1的问题

1、api/config.php定义的 show（） 默认输出类型json不行 


2、微信支付没有做也没有代码

    2.1、$data = input('post.','','htmlentities');   // 将用户添加数据实体化 在thinkphp/helper.php 第三个参数是过滤方法
    
    2.2、反转换         {编辑框内容|html_entity_decode} 
    
    2.3、还可以在config.php里的默认全局过滤方法里填写 htmlentities 如果有多种可以用逗号隔开
    
3、老师代码中没有 微信支付的代码 Order.php Fork了一个有代码的

4、在public/nav 动态加载样式后 有点问题
    4.1、已经登录下再去登录显示 未定义变量：controller 



仿百度糯米的微信支付
哇，如果你的简历写 3-5 年，上面问题基本不会问吧，可能会问下面的：你做过哪些项目，主要用到哪些知识？项目中遇到什么困难，怎么实现的？如果我要你开发一个财务模块，怎么开发，大致说下流程，多久能完成？你接触过哪些支付模式，说说支付的流程？你阅读过 laravel 源码吗，说一下你的独有的体会或技术？你有做电商项目吗，说下创建订单到下单流程？你有用 redis 吗，说下用到什么功能了？会 linux 环境下开发吗？
