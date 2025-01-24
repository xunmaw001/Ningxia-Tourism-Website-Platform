<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">

<head>
    <%@ include file="../../static/head.jsp" %>
    <script type="text/javascript" charset="utf-8">
        window.UEDITOR_HOME_URL = "${pageContext.request.contextPath}/resources/ueditor/"; //UEDITOR_HOME_URL、config、all这三个顺序不能改变
    </script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/lang/zh-cn/zh-cn.js"></script>
</head>
<style>
    .error {
        color: red;
    }

    html {
        width: 100%;
        height: 100%;
    }
    body {
        background-position: center center;
        background-size: cover;
        background-repeat: no-repeat;
        overflow: hidden !important;
        width: 100%;
        height: 100%;
        background-image: url('/ningxialvyouwangzhan/img/back-img-bg.jpg') !important;
    }
    .container {
        padding: 0;
        margin: 0;
        display: flex;
        height: 100%;
        width: 100%;
        justify-content: center;
        align-items: center;
    }

    #login-wrapper {
        display: flex;
        flex-direction: column;
        position: inherit;
        height: 400px;
        width: 400px;
        margin: 0;
        padding: 0 0 20px 0;
        border-radius: 40px;
        border-width: 0;
        border-style: solid;
        border-color: rgba(0,0,0,.3);
        background-color: rgba(255, 255, 255, 0.6);
        box-shadow: 0 0 6px rgba(30, 144, 255, 0);
    }

    #login-wrapper h1 {
        line-height: 60px;
        width: 100%;
        color: rgba(0, 0, 0, 1);
        font-size: 16px;
        margin: -65px 0 0 0;
        padding: 0;
        border-radius: 0;
        border-width: 0;
        border-style: solid;
        border-color: rgba(0,0,0,.3);
        background-color: rgba(30, 144, 255, 0);
        box-shadow: 0 0 6px rgba(30, 144, 255, 0);
        text-align: center;
    }

    #registerForm .form-group-l-r {
        display: flex;
        flex-wrap: wrap;
    }

    #registerForm .form-group {
        display: flex;
        align-items: center;
        flex-wrap: wrap;
        height: 40px;
        width: 80%;
        margin: 0px auto;
        padding: 0;
        border-radius: 0;
        border-width: 0;
        border-style: solid;
        border-color: rgba(0,0,0,1);
        background-color: rgba(0,0,0,0);
        box-shadow: 0 0 6px rgba(255,0,0,0);
    }

    #registerForm .form-group .label {
        display:none;
        width: 72px;
        line-height: 44px;
        margin: 0;
        color: #1e90ff;
        font-size: 16px;
        padding: 0;
        border-radius: 0;
        border-width: 0;
        border-style: solid;
        border-color: rgba(0,0,0,0);
        background-color: transparent;
        box-shadow: 0 0 6px rgba(255,0,0,0);
        text-align: left;
    }

    #registerForm .form-group .form-control-i {
        width: 100%;
        height: 38px;
        margin: 30px 0 0 0;
        color: rgba(0, 0, 0, 1);
        font-size: 14px;
        padding: 0 10px;
        border-radius: 8px;
        border-width: 1px;
        border-style: solid;
        border-color: rgba(102, 102, 153, 1);
        background-color: rgba(255, 255, 255, 1);
        box-shadow: 0 0 6px rgba(30, 144, 255, 0);
        text-align: center;
    }

    #registerForm .form-group .form-control-i:focus {
        outline: 0 none;
    }

    #registerForm .emails #email {
        width: 240px;
        height: 38px;
        margin: 30px 0 0 0;
        color: #606266;
        font-size: 14px;
        padding: 0 12px;
        border-radius: 8px 0 0 8px;
        border-width: 1px;
        border-style: solid;
        border-color: #606266;
        background-color: #fff;
        box-shadow: 0 0 6px rgba(0,0,0,0);
        text-align: left;
    }
    #registerForm .emails .btn {
        width: 80px;
        height: 38px;
        line-height: 38px;
        margin: 30px 0 0 0;
        color: #fff;
        font-size: 12px;
        padding: 0;
        border-radius: 0 8px 8px 0;
        border-width: 0;
        border-style: solid;
        border-color: rgba(255,0,0,0);
        background-color: #1e90ff;
        box-shadow: 0 0 6px rgba(0,0,0,0);
    }

    #registerForm button.pull-right {
        outline: none;
        width: 60%;
        height: 38px;
        margin: 40px auto 0;
        color: black;
        font-size: 14px;
        padding: 0 10px;
        border-radius: 50px;
        border-width: 0;
        border-style: solid;
        border-color: #ccc;
        background-color: rgba(102, 102, 153, 1);
        box-shadow: 0 0 6px rgba(30, 144, 255, 0);
    }

    .r-login {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 140px;
        height: 28px;
        margin: 0px auto;
        color: rgba(0, 0, 0, 1);
        font-size: 14px;
        padding: 0;
        border-radius: 8px;
        border-width: 0;
        border-style: solid;
        border-color: #ccc;
        background-color: rgba(255, 0, 0, 0);
        box-shadow: 0 0 6px rgba(255,0,0,0);
    }

    .r-login a {
        text-decoration: none;
        color: inherit;
    }
</style>
<body>
    <!-- Preloader -->
    <div id="preloader">
        <div id="status">&nbsp;</div>
    </div>

    <div class="container" style="position: relative;">

        <div class="" id="login-wrapper">
            <h1>注册</h1>
                <form id="registerForm" action="" method="post">
                <input id="updateId" name="id" type="hidden">
               <div class="form-group">
                   <label class="label">账户</label>
                   <input id="username" name="username" class="form-control-i"
                          placeholder="账户">
               </div>
               <div class="form-group">
                   <label class="label">密码</label>
                   <input type="password" id="password" name="password" class="form-control-i"
                          placeholder="密码">
               </div>
               <div class="form-group">
                   <label class="label">重复密码</label>
                   <input type="password" id="password1" name="password1" class="form-control-i"
                          placeholder="重复密码">
               </div>
               <div class="form-group">
                   <label class="label">商家名称</label>
                   <input id="shangjiaName" name="shangjiaName" class="form-control-i"
                          placeholder="商家名称">
               </div>
               <div class="form-group">
                   <label class="label">联系方式</label>
                   <input id="shangjiaPhone" name="shangjiaPhone" class="form-control-i"
                          onchange="phoneChickValue(this)"  placeholder="联系方式">
               </div>
               <div class="form-group">
                   <label class="label">邮箱</label>
                   <input id="shangjiaEmail" name="shangjiaEmail" class="form-control-i"
                          placeholder="邮箱">
               </div>
               <div class="form-group">
                   <label class="label">商家信用类型</label>
                   <select id="shangjiaXingjiTypesSelect" name="shangjiaXingjiTypes" class="form-control-i">
                   </select>
               </div>
               <div class="form-group  col-md-12">
                   <label class="label">商家介绍</label>
                   <input id="shangjiaContentupload" name="file" type="file">
                   <script id="shangjiaContentEditor" type="text/plain"
                           style="width:800px;height:230px;"></script>
                   <script type = "text/javascript" >
                   //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
                   //相见文档配置属于你自己的编译器
                   var shangjiaContentUe = UE.getEditor('shangjiaContentEditor', {
                       toolbars: [
                           [
                               'undo', //撤销
                               'bold', //加粗
                               'redo', //重做
                               'underline', //下划线
                               'horizontal', //分隔线
                               'inserttitle', //插入标题
                               'cleardoc', //清空文档
                               'fontfamily', //字体
                               'fontsize', //字号
                               'paragraph', //段落格式
                               'inserttable', //插入表格
                               'justifyleft', //居左对齐
                               'justifyright', //居右对齐
                               'justifycenter', //居中对
                               'justifyjustify', //两端对齐
                               'forecolor', //字体颜色
                               'fullscreen', //全屏
                               'edittip ', //编辑提示
                               'customstyle', //自定义标题
                           ]
                       ]
                   });
                   </script>
                   <input type="hidden" name="shangjiaContent" id="shangjiaContent-input">
               </div>
              <div class="form-group-l-r">
                  <button id="submitBtn" class="btn btn-primary pull-right" type="button">注 册</button>
              </div>
              <div class="r-login">
                  <a href="javascript:window.location.href='../../login.jsp'">已有账号，直接登录</a>
              </div>
            </form>
        </div>
    </div>
    <%@ include file="../../static/foot.jsp" %>
    <script src="${pageContext.request.contextPath}/resources/js/vue.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.ui.widget.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.fileupload.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.form.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/js/validate/jquery.validate.min.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/js/validate/messages_zh.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/js/validate/card.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/js/datetimepicker/bootstrap-datetimepicker.min.js"></script>
    <script>
        <%@ include file="../../utils/menu.jsp"%>
        <%@ include file="../../static/utils.js"%>
        <%@ include file="../../utils/baseUrl.jsp"%>

        var tableName = "shangjia";
        var pageType = "register";
        var updateId = "";
        var crossTableId = -1;
        var crossTableName = '';
        var ruleForm = {};
        var crossRuleForm = {};

        // 下拉框数组
        <!-- 当前表的下拉框数组 -->
        var shangjiaXingjiTypesOptions = [];

        var ruleForm = {};


        // 文件上传
        function upload() {
        <!-- 当前表的文件上传 -->

        $('#shangjiaPhotoupload').fileupload({
            url: baseUrl + 'file/upload',
            headers: {token: window.sessionStorage.getItem("token")},
            dataType: 'json',
            done: function (e, data) {
                var photoUrl= 'file/download?fileName=' + data.result.file;
                document.getElementById('shangjiaPhotoImg').setAttribute('src',baseUrl+photoUrl);
                document.getElementById('shangjiaPhoto-input').setAttribute('value',photoUrl);
            }
        });


        $('#shangjiaContentupload').fileupload({
            url: baseUrl + 'file/upload',
            headers: {token: window.sessionStorage.getItem("token")},
            dataType: 'json',
            done: function (e, data) {
                UE.getEditor('shangjiaContentEditor').execCommand('insertHtml', '<img src=\"' + baseUrl + 'upload/' + data.result.file + '\" width=900 height=560>');
            }
        });

        }

        // 表单提交
        function submit() {

            if (validform() == true) {
                let data = {};
                getContent();
                if( $("#password").val() == null || $("#password").val() == "" ){
                    layui.layer.msg("密码不能为空", {time: 2000,icon: 5});
                    return false;
                }else if( $("#password").val() != $("#password1").val() ){
                    layui.layer.msg("两次密码不一致", {time: 2000,icon: 5});
                    return false;
                }
                let value = $('#registerForm').serializeArray();
                $.each(value, function (index, item) {
                    data[item.name] = item.value;
                });
                httpJson("shangjia/register", "POST", data, (res) => {
                    if(res.code == 0){
                        layui.layer.msg("注册成功", {time: 2000,icon: 6});
                        if (window.sessionStorage.getItem('onlyme') != null && window.sessionStorage.getItem('onlyme') == "true") {
                            window.sessionStorage.removeItem('onlyme');
                            window.location.href="../../login.jsp";
                        } else {
                            window.location.href ="../../login.jsp";
                        }
                    }
                });
            } else {
                layui.layer.msg("表单未填完整或有错误", {time: 2000,icon: 5});
            }
        }

        <!-- 查询当前表的所有列表 -->
        function shangjiaXingjiTypesSelect() {
            //填充下拉框选项
            http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=shangjia_xingji_types", "GET", {}, (res) => {
                if(res.code == 0){
                    shangjiaXingjiTypesOptions = res.data.list;
                }
            });
        }

        //初始化下拉框
        <!-- 初始化当前表的下拉框 -->
        function initializationShangjiaxingjitypesSelect(){
            var shangjiaXingjiTypesSelect = document.getElementById('shangjiaXingjiTypesSelect');
            if(shangjiaXingjiTypesSelect != null && shangjiaXingjiTypesOptions != null  && shangjiaXingjiTypesOptions.length > 0 ){
                for (var i = 0; i < shangjiaXingjiTypesOptions.length; i++) {
                        shangjiaXingjiTypesSelect.add(new Option(shangjiaXingjiTypesOptions[i].indexName,shangjiaXingjiTypesOptions[i].codeIndex));
                }
            }
        }




        // 获取富文本框内容
        function getContent() {

            <!-- 获取当前表的富文本框内容 -->
            var shangjiaContentEditor =UE.getEditor('shangjiaContentEditor');
            if (shangjiaContentEditor.hasContents()) {
                $('#shangjiaContent-input').attr('value', shangjiaContentEditor.getPlainTxt());
            }
        }

        function exit() {
            window.location.href = "../../login.jsp";
        }
        // 表单校验
        function validform() {
            return $("#registerForm").validate({
                rules: {
                        username: "required",
                        password: "required",
                        shangjiaName: "required",
                        shangjiaPhone: "required",
                        shangjiaEmail: "required",
                        shangjiaPhoto: "required",
                        shangjiaXingjiTypes: "required",
                        newMoney: "required",
                        shangjiaContent: "required",
                        shangjiaDelete: "required",
                },
                messages: {
                        username: "账户不能为空",
                        password: "密码不能为空",
                        shangjiaName: "商家名称不能为空",
                        shangjiaPhone: "联系方式不能为空",
                        shangjiaEmail: "邮箱不能为空",
                        shangjiaPhoto: "营业执照展示不能为空",
                        shangjiaXingjiTypes: "商家信用类型不能为空",
                        newMoney: "现有余额不能为空",
                        shangjiaContent: "商家介绍不能为空",
                        shangjiaDelete: "逻辑删除不能为空",
                }
            }).form();
        }

        $(document).ready(function () {
            $('#exitBtn').on('click', function (e) {
                e.preventDefault();
                exit();
            });
            //查询所有下拉框
        <!--  当前表的下拉框  -->
            shangjiaXingjiTypesSelect();

            // 初始化下拉框
        <!--  初始化当前表的下拉框  -->
            initializationShangjiaxingjitypesSelect();
            //注册表单验证
            $(validform());
            //初始化上传按钮
            upload();
        <%@ include file="../../static/myInfo.js"%>
                    $('#submitBtn').on('click', function (e) {
                        e.preventDefault();
                        //console.log("点击了...提交按钮");
                        submit();
                    });
        });
        layui.use(['layer' , 'jquery'], function() {
            var layer = layui.layer;
            var jquery = layui.jquery;
            // layui.layer.msg("输入不合法", {time: 2000,icon: 5});
            //    5失败 6成功
        });


        // 用户登出
        <%@ include file="../../static/logout.jsp"%>
    </script>
</body>

</html>