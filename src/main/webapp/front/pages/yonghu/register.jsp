<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>注册</title>
    <link rel="stylesheet" type="text/css" href="../../layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="../../xznstatic/css/public.css"/>
    <link rel="stylesheet" type="text/css" href="../../xznstatic/css/login.css"/>

    <link rel="stylesheet" href="../../css/theme.css"/>
    <style type="text/css">
        /*开始=======================================公共样式===================================================开始*/
        .register {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            width: 100%;
            height: 100%;
            background-attachment: fixed;
            background-size: cover;
            background-position: center;
            background-image: url(/ningxialvyouwangzhan/img/front-img-bg.jpg);
        }

        .register form {
            box-sizing: border-box;
            min-height: 400px;
            display: flex;
            flex-direction: column;
            justify-content: center !important;
        }

        .register .logo,
        .register .title {
            box-sizing: border-box;
        }

        .register .logo img {
            display: block;
        }

        .register .title {
            text-align: center;
        }

        .register .form-item {
            display: flex;
            align-items: center;
            flex-wrap: wrap;
            box-sizing: border-box;
        }

        .register .form-item input,
        .register .form-label {
            box-sizing: border-box;
        }

        .register .btn-submit {
            display: block;
            box-sizing: border-box;
        }

        .register form p.txt {
            width: 100%;
            margin: 0;
            box-sizing: border-box;
        }

        .layui-unselect {
            margin-left: -5px;
            margin-top: 3px;
            border: 0px;
        }



        /*定义滚动条高宽及背景 高宽分别对应横竖滚动条的尺寸*/
        .zhuce::-webkit-scrollbar {
            width: 10px;
            height: 1px;
            border-radius: 10px;
            background-color: var(--publicMainColor);
        }

        /*定义滚动条轨道 内阴影+圆角*/
        .zhuce::-webkit-scrollbar-track {
            -webkit-box-shadow: inset 0 0 10px var(--publicMainColor);
            border-radius: 50px;
            background-color: var(--publicMainColor);
        }

        /*定义滑块 内阴影+圆角*/
        .zhuce::-webkit-scrollbar-thumb {
            border-radius: 50px;
            -webkit-box-shadow: inset 0 0 10px var(--publicSubColor);
            background-color: var(--publicSubColor);
        }

        .zhuce::-webkit-scrollbar {
            /* display: none; */
        }

        /*返回按钮位置*/
        .returnPosition {
            text-align: center;
        }

        /*结束=======================================公共样式===================================================结束*/
/*文本框div背景颜色*/
.inpotdivBackGround {
}
/*返回按钮位置*/
.returnPosition {
    text-align:center;
}
/*按钮背景颜色*/
.sub_backgroundColor {
    background-color: var(--publicMainColor);
}

.zhuce {
background-color: white;
display: inline-block;
overflow-x: hidden;
overflow-y: scroll;
}
    </style>
</head>
<body>
<div class="register" id="app">
<div style="width: 650px;height: 600px;background-color: var(--publicSubColor);border-radius: 20px;">
    <form class="layui-form login-form" lay-filter="myForm" style="width: 480px;height: 550px;margin: 25px auto;">
        <div style="position: sticky;top: 0;height: 40px;background-color: #fff;">
            <p class="title" v-if="true"
               :style='{"padding":"0 10px","boxShadow":"0 0 0px rgba(255,0,0,.8)","margin":"10px auto","borderColor":"rgba(0,0,0,1)","backgroundColor":"rgba(247, 247, 247, 0)","color":"red","isshow":true,"borderRadius":"8px","borderWidth":"0","width":"110px","lineHeight":"32px","fontSize":"17px","borderStyle":"solid"}'>
                用户注册</p>
        </div>
        <div class="zhuce">            <div :style='{"padding":"0","boxShadow":"0 0 6px rgba(255,0,0,0)","margin":"0 auto","borderColor":"rgba(0,0,0,1)","borderRadius":"0","borderWidth":"0 0 1px 0","width":"80%","borderStyle":"solid","height":"64px"}'
                 class="form-item layui-form-text inpotdivBackGround">
                <label v-if="false"
                       :style='{"padding":"0 10px","boxShadow":"0 0 6px rgba(255,0,0,0)","borderColor":"rgba(0,0,0,0)","backgroundColor":"transparent","color":"#333","borderRadius":"0","textAlign":"right","borderWidth":"0","width":"110px","fontSize":"16px","borderStyle":"solid"}'
                       class="form-label">账户：</label>
                <input :style='{"padding":"0 10px","boxShadow":"0 0 6px var(--publicMainColor)","borderColor":"var(--publicMainColor)","backgroundColor":"#fff","color":"rgba(59, 46, 126, 1)","borderRadius":"8px","textAlign":"left","borderWidth":"1px","width":"100%","fontSize":"14px","borderStyle":"solid","height":"44px"}'
                       lay-verify="required" type="text" id="username" name="username"
                       placeholder="请输入账户" autocomplete="off"
                       class="layui-input">
            </div>
            <div :style='{"padding":"0","boxShadow":"0 0 6px rgba(255,0,0,0)","margin":"0 auto","borderColor":"rgba(0,0,0,1)","borderRadius":"0","borderWidth":"0 0 1px 0","width":"80%","borderStyle":"solid","height":"64px"}'
                 class="form-item layui-form-text inpotdivBackGround">
                <label v-if="false"
                       :style='{"padding":"0 10px","boxShadow":"0 0 6px rgba(255,0,0,0)","borderColor":"rgba(0,0,0,0)","backgroundColor":"transparent","color":"#333","borderRadius":"0","textAlign":"right","borderWidth":"0","width":"110px","fontSize":"16px","borderStyle":"solid"}'
                       class="form-label">密码：</label>
                <input type="password"
                       :style='{"padding":"0 10px","boxShadow":"0 0 6px var(--publicMainColor)","borderColor":"var(--publicMainColor)","backgroundColor":"#fff","color":"rgba(59, 46, 126, 1)","borderRadius":"8px","textAlign":"left","borderWidth":"1px","width":"100%","fontSize":"14px","borderStyle":"solid","height":"44px"}'
                       lay-verify="password1|required" type="password" id="password"
                       name="password" placeholder="请输入密码"
                       autocomplete="off" class="layui-input">
            </div>
            <div :style='{"padding":"0","boxShadow":"0 0 6px rgba(255,0,0,0)","margin":"0 auto","borderColor":"rgba(0,0,0,1)","borderRadius":"0","borderWidth":"0 0 1px 0","width":"80%","borderStyle":"solid","height":"64px"}'
                 class="form-item layui-form-text inpotdivBackGround">
                <label v-if="false"
                       :style='{"padding":"0 10px","boxShadow":"0 0 6px rgba(255,0,0,0)","borderColor":"rgba(0,0,0,0)","backgroundColor":"transparent","color":"#333","borderRadius":"0","textAlign":"right","borderWidth":"0","width":"110px","fontSize":"16px","borderStyle":"solid"}'
                       class="form-label">密码：</label>
                <input :style='{"padding":"0 10px","boxShadow":"0 0 6px var(--publicMainColor)","borderColor":"var(--publicMainColor)","backgroundColor":"#fff","color":"rgba(59, 46, 126, 1)","borderRadius":"8px","textAlign":"left","borderWidth":"1px","width":"100%","fontSize":"14px","borderStyle":"solid","height":"44px"}'
                       lay-verify="password2|required" type="password" id="password2"
                       name="password2"
                       placeholder="请重复输入密码" autocomplete="off"
                       class="layui-input">
            </div>
                    <div :style='{"padding":"0","boxShadow":"0 0 6px rgba(255,0,0,0)","margin":"0 auto","borderColor":"rgba(0,0,0,1)","borderRadius":"0","borderWidth":"0 0 1px 0","width":"80%","borderStyle":"solid","height":"64px"}'
                 class="form-item layui-form-text inpotdivBackGround">
                <label v-if="false"
                       :style='{"padding":"0 10px","boxShadow":"0 0 6px rgba(255,0,0,0)","borderColor":"rgba(0,0,0,0)","backgroundColor":"transparent","color":"#333","borderRadius":"0","textAlign":"right","borderWidth":"0","width":"110px","fontSize":"16px","borderStyle":"solid"}'
                       class="form-label">用户姓名：</label>
                <input :style='{"padding":"0 10px","boxShadow":"0 0 6px var(--publicMainColor)","borderColor":"var(--publicMainColor)","backgroundColor":"#fff","color":"rgba(59, 46, 126, 1)","borderRadius":"8px","textAlign":"left","borderWidth":"1px","width":"100%","fontSize":"14px","borderStyle":"solid","height":"44px"}'
                       lay-verify="required" type="text" id="yonghuName" name="yonghuName"
                       placeholder="请输入用户姓名" autocomplete="off"
                       class="layui-input">
            </div>
<!-- 手机号 -->
            <div :style='{"padding":"0","boxShadow":"0 0 6px rgba(255,0,0,0)","margin":"0 auto","borderColor":"rgba(0,0,0,1)","borderRadius":"0","borderWidth":"0 0 1px 0","width":"80%","borderStyle":"solid","height":"64px"}'
                 class="form-item layui-form-text inpotdivBackGround">
                <label v-if="false"
                       :style='{"padding":"0 10px","boxShadow":"0 0 6px rgba(255,0,0,0)","borderColor":"rgba(0,0,0,0)","backgroundColor":"transparent","color":"#333","borderRadius":"0","textAlign":"right","borderWidth":"0","width":"110px","fontSize":"16px","borderStyle":"solid"}'
                       class="form-label">用户手机号：</label>
                <input :style='{"padding":"0 10px","boxShadow":"0 0 6px var(--publicMainColor)","borderColor":"var(--publicMainColor)","backgroundColor":"#fff","color":"rgba(59, 46, 126, 1)","borderRadius":"8px","textAlign":"left","borderWidth":"1px","width":"100%","fontSize":"14px","borderStyle":"solid","height":"44px"}'
                       lay-verify="phone|required" type="text" id="yonghuPhone" name="yonghuPhone"
                       placeholder="请输入用户手机号" autocomplete="off"
                       class="layui-input">
            </div>
        <!-- 身份证号 -->
            <div :style='{"padding":"0","boxShadow":"0 0 6px rgba(255,0,0,0)","margin":"0 auto","borderColor":"rgba(0,0,0,1)","borderRadius":"0","borderWidth":"0 0 1px 0","width":"80%","borderStyle":"solid","height":"64px"}'
                 class="form-item layui-form-text inpotdivBackGround">
                <label v-if="false"
                       :style='{"padding":"0 10px","boxShadow":"0 0 6px rgba(255,0,0,0)","borderColor":"rgba(0,0,0,0)","backgroundColor":"transparent","color":"#333","borderRadius":"0","textAlign":"right","borderWidth":"0","width":"110px","fontSize":"16px","borderStyle":"solid"}'
                       class="form-label">用户身份证号：</label>
                <input :style='{"padding":"0 10px","boxShadow":"0 0 6px var(--publicMainColor)","borderColor":"var(--publicMainColor)","backgroundColor":"#fff","color":"rgba(59, 46, 126, 1)","borderRadius":"8px","textAlign":"left","borderWidth":"1px","width":"100%","fontSize":"14px","borderStyle":"solid","height":"44px"}'
                       lay-verify="identity|required" type="text" id="yonghuIdNumber"
                       name="yonghuIdNumber" placeholder="请输入用户身份证号"
                       autocomplete="off" class="layui-input">
            </div>
                        <div :style='{"padding":"0","boxShadow":"0 0 6px rgba(255,0,0,0)","margin":"0 auto","borderColor":"rgba(0,0,0,1)","borderRadius":"0","borderWidth":"0 0 1px 0","width":"80%","borderStyle":"solid","height":"64px"}'
                     class="inpotdivBackGround">
                    <div :style='{"margin-top":"10px","padding":"0 10px","boxShadow":"0 0 6px var(--publicMainColor)","borderColor":"var(--publicMainColor)","backgroundColor":"#fff","color":"rgba(59, 46, 126, 1)","borderRadius":"8px","textAlign":"left","borderWidth":"1px","width":"auto","fontSize":"14px","borderStyle":"solid","height":"44px"}'>
                        <select name="sexTypes" id="sexTypes">
<!--                            <option value="">请选择性别</option>-->
                            <option v-for="(item,index) in sexTypesList" :value="item.codeIndex"
                                    :key="item.codeIndex">{{ item.indexName }}
                            </option>
                        </select>
                    </div>
                </div>
<!-- 邮箱 -->
            <div :style='{"padding":"0","boxShadow":"0 0 6px rgba(255,0,0,0)","margin":"0 auto","borderColor":"rgba(0,0,0,1)","borderRadius":"0","borderWidth":"0 0 1px 0","width":"80%","borderStyle":"solid","height":"64px"}'
                 class="form-item layui-form-text inpotdivBackGround">
                <label v-if="false"
                       :style='{"padding":"0 10px","boxShadow":"0 0 6px rgba(255,0,0,0)","borderColor":"rgba(0,0,0,0)","backgroundColor":"transparent","color":"#333","borderRadius":"0","textAlign":"right","borderWidth":"0","width":"110px","fontSize":"16px","borderStyle":"solid"}'
                       class="form-label">用户邮箱：</label>
                <input :style='{"padding":"0 10px","boxShadow":"0 0 6px var(--publicMainColor)","borderColor":"var(--publicMainColor)","backgroundColor":"#fff","color":"rgba(59, 46, 126, 1)","borderRadius":"8px","textAlign":"left","borderWidth":"1px","width":"100%","fontSize":"14px","borderStyle":"solid","height":"44px"}'
                       lay-verify="email|required" type="text" id="yonghuEmail" name="yonghuEmail"
                       placeholder="请输入用户邮箱" autocomplete="off"
                       class="layui-input">
            </div>
</div>
<div style="position: sticky;bottom: 0;background-color: #fff;height: 120px;padding-top: 10px;">
    <div class="layui-btn layui-btn-fluid layui-btn-danger btn-submit sub_backgroundColor" lay-submit lay-filter="register" style="width: 80px;
height: 70px;background-color: var(--publicMainColor);margin: 0 auto;line-height: 70px;border-radius: 50%;" >注册</div>
    <p :style='{"color":"rgba(59, 46, 126, 1)","fontSize":"12px"}' class="returnPosition" style="margin-top: 5px;"><a style="color: var(--publicSubColor);"
                                                                                                                      href="javascript:window.location.href='../login/login.jsp'">已有账号登录</a></p>
</div>
</form>
</div></div>

<script src="../../layui/layui.js"></script>
<script src="../../js/vue.js"></script>
<!-- 引入element组件库 -->
<script src="../../xznstatic/js/element.min.js"></script>
<!-- 引入element样式 -->
<link rel="stylesheet" href="../../xznstatic/css/element.min.css">
<!-- 组件配置信息 -->
<script src="../../js/config.js"></script>
<!-- 扩展插件配置信息 -->
<script src="../../modules/config.js"></script>
<!-- 工具方法 -->
<script src="../../js/utils.js"></script>
<!-- 校验格式工具类 -->
<script src="../../js/validate.js"></script>

<script>
    var vue = new Vue({
        el: '#app',
        data: {
            sexTypesList: [],
        },
        updated: function () {
            layui.form.render(null, 'myForm');
        },
        methods: {
            jump(url) {
                jump(url);
            },
        }
    });

    layui.use(['layer', 'element', 'carousel', 'form', 'http', 'jquery'], function () {
        var layer = layui.layer;
        var element = layui.element;
        var carousel = layui.carousel;
        var form = layui.form;
        var http = layui.http;
        var jquery = layui.jquery;

        var tablename = http.getParam('tablename');
        //字典表数据容器
        // 性别的查询和初始化
        sexTypesSelect();
        // 表单效验规则
        form.verify({
            // 正整数效验规则
            integer: [
                /^[1-9][0-9]*$/
                , '必须是正整数'
            ]
            // 小数效验规则
            , double: [
                /^[1-9][0-9]{0,5}(\.[0-9]{1,2})?$/
                , '最大整数位为6为,小数最大两位'
            ]
            , password1: function (value, item) { //value：表单的值、item：表单的DOM对象
                var password2 = jquery("#password2").val();
                if (password2 != null && password2 != "" && password2 != "null") {
                    if (value != password2) {
                        return '密码的两次密码不一致';
                    }
                }
            }
            , password2: function (value, item) { //value：表单的值、item：表单的DOM对象
                var password1 = jquery("#password1").val();
                if (password1 != null && password1 != "" && password1 != "null") {
                    if (value != password1) {
                        return '密码的两次密码不一致';
                    }
                }
            }
        });

        // 注册
        form.on('submit(register)', function (data) {
            data = data.field;
            http.requestJson(tablename + '/register', 'post', data, function (res) {
                if(res.code==0){
                    layer.msg('注册成功', {
                        time: 2000,
                        icon: 6
                    }, function () {
                        // 路径访问设置
                        window.location.href = '../login/login.jsp';
                    });
                }else{
                    layer.msg(res.msg, {
                        time: 4000,
                        icon: 5
                    });
                }
            });
            return false
        });


        // 性别的查询
        function sexTypesSelect() {
            //填充下拉框选项
            http.request("dictionary/page?page=1&limit=100&sort=&order=&dicCode=sex_types", "GET", {}, (res) => {
                if (res.code == 0) {
                    vue.sexTypesList = res.data.list;
                }
            });
        }


    });
</script>
</body>
</html>
