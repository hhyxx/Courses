# Vue

+ 是一个用于创建用户界面的开源JavaScript框架，也是一个创建单页应用的Web应用框架
+ Vue.js是一款流行的JavaScript前端框架，旨在更好地组织与简化Web开发。Vue所关注的核心是MVC模式中的视图层，同时，它也能方便地获取数据更新，并通过组件内部特定的方法实现视图与模型的交互。
+ 组件是Vue最为强大的特性之一。为了更好地管理一个大型的应用程序，往往需要将应用切割为小而独立、具有复用性的组件。在Vue中，组件是基础HTML元素的拓展，可方便地自定义其数据与行为。下方的代码是Vue组件的一个示例，渲染为一个能计算鼠标点击次数的按钮。

```html

<!doctype html>
<html lang="en">
<head>
  <title>Vue入门与实例</title>
  <meta charset="utf-8">
</head>
<body>
  <div id="app">
    <!--
      {{ }} 表示一个插值表达式，
      可以插入任意的数值，例如字符串，在script语句块中的变量，函数
    -->
    <h1>{{ message }}</h1> 
    <h1>{{ getContent() }}</h1> 
  </div>  


  <script type="text/javascript" src="./../vue.1.0.26.js"></script>
  <script type="text/javascript">
  	var vm = new Vue({ 	// 一个Vue实例
		  el : '#app', 	// element id
		  data: {  	// data为一个对象，message 为其中的一个字符串变量

		    message : 'Hello world, I am Vue.js'
		  },
      methods:{
        // 方法集合
        getContent(){
          return
        }
      }
		});

    console.log();	// 输出操作

    vm.message = 'Hello world'
  </script>
</body>
</html>
```

