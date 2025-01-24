<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <%@ include file="../../static/head.jsp" %>
    <link href="http://www.bootcss.com/p/bootstrap-datetimepicker/bootstrap-datetimepicker/css/datetimepicker.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap-select.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
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
</style>
<body>
<!-- Pre Loader -->
<div class="loading">
    <div class="spinner">
        <div class="double-bounce1"></div>
        <div class="double-bounce2"></div>
    </div>
</div>
<!--/Pre Loader -->
<div class="wrapper">
    <!-- Page Content -->
    <div id="content">
        <!-- Top Navigation -->
        <%@ include file="../../static/topNav.jsp" %>
        <!-- Menu -->
        <div class="container menu-nav">
            <nav class="navbar navbar-expand-lg lochana-bg text-white">
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="ti-menu text-white"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul id="navUl" class="navbar-nav mr-auto"></ul>
                </div>
            </nav>
        </div>
        <!-- /Menu -->
        <!-- Breadcrumb -->
        <!-- Page Title -->
        <div class="container mt-0">
            <div class="row breadcrumb-bar">
                <div class="col-md-6">
                    <h3 class="block-title">编辑景点订单</h3>
                </div>
                <div class="col-md-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="${pageContext.request.contextPath}/index.jsp">
                                <span class="ti-home"></span>
                            </a>
                        </li>
                        <li class="breadcrumb-item">景点订单管理</li>
                        <li class="breadcrumb-item active">编辑景点订单</li>
                    </ol>
                </div>
            </div>
        </div>
        <!-- /Page Title -->

        <!-- /Breadcrumb -->
        <!-- Main Content -->
        <div class="container">

            <div class="row">
                <!-- Widget Item -->
                <div class="col-md-12">
                    <div class="widget-area-2 lochana-box-shadow">
                        <h3 class="widget-title">景点订单信息</h3>
                        <form id="addOrUpdateForm">
                            <div class="form-row">
                            <!-- 级联表的字段 -->
                                    <div class="form-group col-md-6 aaaaaa jingdain">
                                        <label>景点介绍</label>
                                        <div>
                                            <select style="width: 450px" id="jingdainSelect" name="jingdainSelect"
                                                    class="selectpicker form-control"  data-live-search="true"
                                                    title="请选择" data-header="请选择" data-size="5" data-width="650px">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6 jingdain">
                                        <label>景点名称</label>
                                        <input style="width: 450px" id="jingdainName" name="jingdainName" placeholder="景点名称" class="form-control" readonly>
                                    </div>
                                    <div class="form-group col-md-6 jingdain">
                                        <label>景点照片</label>
                                        <img id="jingdainPhotoImg" src="" width="100" height="100">
                                    </div>
                                    <div class="form-group col-md-6 jingdain">
                                        <label>景点类型</label>
                                        <input style="width: 450px" id="jingdainValue" name="jingdainValue" placeholder="景点类型" class="form-control" readonly>
                                    </div>
                                    <div class="form-group col-md-6 aaaaaa yonghu">
                                        <label>用户</label>
                                        <div>
                                            <select style="width: 450px" id="yonghuSelect" name="yonghuSelect"
                                                    class="selectpicker form-control"  data-live-search="true"
                                                    title="请选择" data-header="请选择" data-size="5" data-width="650px">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6 yonghu">
                                        <label>用户姓名</label>
                                        <input style="width: 450px" id="yonghuName" name="yonghuName" placeholder="用户姓名" class="form-control" readonly>
                                    </div>
                            <!-- 当前表的字段 -->
                                    <input id="updateId" name="id" type="hidden">
                                    <div class="form-group col-md-6 jingdainOrderUuidNumberDiv">
                                        <label>订单编号</label>
                                        <input style="width: 450px" id="jingdainOrderUuidNumber" name="jingdainOrderUuidNumber" class="form-control"
                                               placeholder="订单编号">
                                    </div>
                                <input id="jingdainId" name="jingdainId" type="hidden">
                                <input id="yonghuId" name="yonghuId" type="hidden">
                                    <div class="form-group col-md-6 buyNumberDiv">
                                        <label>购买数量</label>
                                        <input style="width: 450px" id="buyNumber" name="buyNumber" class="form-control"
                                               onchange="integerChickValue(this)"  placeholder="购买数量">
                                    </div>

                                    <div class="form-group col-md-6 jingdainOrderTimeDiv">
                                        <label>预约时间</label>
                                        <input style="width: 450px" id="jingdainOrderTime-input" name="jingdainOrderTime" type="text" class="form-control layui-input">
                                    </div>
                                    <div class="form-group col-md-6 jingdainOrderTruePriceDiv">
                                        <label>实付价格</label>
                                        <input style="width: 450px" id="jingdainOrderTruePrice" name="jingdainOrderTruePrice" class="form-control"
                                               onchange="doubleChickValue(this)" placeholder="实付价格">
                                    </div>
                                    <div class="form-group col-md-6 jingdainOrderTypesDiv">
                                        <label>订单类型</label>
                                        <select style="width: 450px" id="jingdainOrderTypesSelect" name="jingdainOrderTypes" class="form-control"></select>
                                    </div>
                                    <div class="form-group-1 col-md-6 mb-3" style="display: flex;flex-wrap: wrap;">
                                        <button id="submitBtn" type="button" class="btn btn-primary btn-lg">提交</button>
                                        <button id="exitBtn" type="button" class="btn btn-primary btn-lg">返回</button>
                                    </div>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- /Widget Item -->
            </div>
        </div>
        <!-- /Main Content -->
    </div>
    <!-- /Page Content -->
</div>
<!-- Back to Top -->
<a id="back-to-top" href="#" class="back-to-top">
    <span class="ti-angle-up"></span>
</a>
<!-- /Back to Top -->
<%@ include file="../../static/foot.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.ui.widget.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.fileupload.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.form.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/validate/jquery.validate.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/resources/js/validate/messages_zh.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/resources/js/validate/card.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/resources/js/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap-select.js" type="text/javascript" charset="utf-8"></script>
<!-- <script src="${pageContext.request.contextPath}/resources/js/laydate.js"></script> -->
<script>
    <%@ include file="../../utils/menu.jsp"%>
    <%@ include file="../../static/setMenu.js"%>
    <%@ include file = "../../static/utils.js" %>
    <%@ include file="../../utils/baseUrl.jsp"%>

    var sessionTable = window.sessionStorage.getItem("accountTableName");//登录账户所在表名
    var role         = window.sessionStorage.getItem("role");//权限
    var userId       = window.sessionStorage.getItem("userId");//当前登录人的id
    var tableName = "jingdainOrder";
    var pageType = "add-or-update";
    var updateId = "";
    var ruleForm = {};


    // 下拉框数组
        <!-- 当前表的下拉框数组 -->
    var jingdainOrderTypesOptions = [];
        <!-- 级联表的下拉框数组 -->
    var jingdainOptions = [];
    var yonghuOptions = [];

    // 文件上传
    function upload() {

        <!-- 当前表的文件上传 -->

    }

    // 表单提交
    function submit() {
        if (validform() == true && compare() == true) {
            let data = {};
            getContent();
            if(window.sessionStorage.getItem('role') != '景点介绍'){//当前登录用户不为这个
                if($("#jingdainId") !=null){
                    var jingdainId = $("#jingdainId").val();
                    if(jingdainId == null || jingdainId =='' || jingdainId == 'null'){
                        layui.layer.msg("景点不能为空", {time: 2000,icon: 5});
                        return;
                    }
                }
            }
            if(window.sessionStorage.getItem('role') != '用户'){//当前登录用户不为这个
                if($("#yonghuId") !=null){
                    var yonghuId = $("#yonghuId").val();
                    if(yonghuId == null || yonghuId =='' || yonghuId == 'null'){
                        layui.layer.msg("用户不能为空", {time: 2000,icon: 5});
                        return;
                    }
                }
            }
            let value = $('#addOrUpdateForm').serializeArray();
            $.each(value, function (index, item) {
                data[item.name] = item.value;
            });
            var urlParam;
            var successMes = '';
            if (updateId != null && updateId != "null" && updateId != '') {
                urlParam = 'update';
                successMes = '修改成功';
            } else {
                urlParam = 'save';
                    successMes = '添加成功';

            }
            httpJson("jingdainOrder/" + urlParam, "POST", data, (res) => {
                if(res.code == 0){
                    window.sessionStorage.removeItem('addjingdainOrder');
                    window.sessionStorage.removeItem('updateId');
                    let flag = true;
                    if (flag) {
                        layui.layer.msg(successMes, {time: 2000,icon: 5});
                    }
                    if (window.sessionStorage.getItem('onlyme') != null && window.sessionStorage.getItem('onlyme') == "true") {
                        window.sessionStorage.removeItem('onlyme');
                        window.sessionStorage.setItem("reload","reload");
                        window.parent.location.href = "${pageContext.request.contextPath}/index.jsp";
                    } else {
                        window.location.href = "list.jsp";
                    }
                }
            });
        } else {
            layui.layer.msg("表单未填完整或有错误", {time: 2000,icon: 5});
        }
    }

    // 查询列表
        <!-- 查询当前表的所有列表 -->
        function jingdainOrderTypesSelect() {
            //填充下拉框选项
            http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=jingdain_order_types", "GET", {}, (res) => {
                if(res.code == 0){
                    jingdainOrderTypesOptions = res.data.list;
                }
            });
        }
        <!-- 查询级联表的所有列表 -->
        function jingdainSelect() {
            //填充下拉框选项
            http("jingdain/page?page=1&limit=100&sort=&order=", "GET", {}, (res) => {
                if(res.code == 0){
                    jingdainOptions = res.data.list;
                }
            });
        }

        function jingdainSelectOne(id) {
            http("jingdain/info/"+id, "GET", {}, (res) => {
                if(res.code == 0){
                    ruleForm = res.data;
                    jingdainShowImg();
                    jingdainShowVideo();
                    jingdainDataBind();
                }
            });
        }
        function yonghuSelect() {
            //填充下拉框选项
            http("yonghu/page?page=1&limit=100&sort=&order=", "GET", {}, (res) => {
                if(res.code == 0){
                    yonghuOptions = res.data.list;
                }
            });
        }

        function yonghuSelectOne(id) {
            http("yonghu/info/"+id, "GET", {}, (res) => {
                if(res.code == 0){
                    ruleForm = res.data;
                    yonghuShowImg();
                    yonghuShowVideo();
                    yonghuDataBind();
                }
            });
        }



    // 初始化下拉框
    <!-- 初始化当前表的下拉框 -->
        function initializationJingdainOrderTypesSelect(){
            var jingdainOrderTypesSelect = document.getElementById('jingdainOrderTypesSelect');
            if(jingdainOrderTypesSelect != null && jingdainOrderTypesOptions != null  && jingdainOrderTypesOptions.length > 0 ){
                jingdainOrderTypesSelect.options.length=0;
                for (var i = 0; i < jingdainOrderTypesOptions.length; i++) {
                    jingdainOrderTypesSelect.add(new Option(jingdainOrderTypesOptions[i].indexName,jingdainOrderTypesOptions[i].codeIndex));
                }
            }
        }

        function initializationjingdainSelect() {
            var jingdainSelect = document.getElementById('jingdainSelect');
            if(jingdainSelect != null && jingdainOptions != null  && jingdainOptions.length > 0 ) {
                for (var i = 0; i < jingdainOptions.length; i++) {
                        jingdainSelect.add(new Option(jingdainOptions[i].jingdainName, jingdainOptions[i].id));
                }

                $("#jingdainSelect").change(function(e) {
                        jingdainSelectOne(e.target.value);
                });
            }

        }

        function initializationyonghuSelect() {
            var yonghuSelect = document.getElementById('yonghuSelect');
            if(yonghuSelect != null && yonghuOptions != null  && yonghuOptions.length > 0 ) {
                for (var i = 0; i < yonghuOptions.length; i++) {
                        yonghuSelect.add(new Option(yonghuOptions[i].yonghuName, yonghuOptions[i].id));
                }

                $("#yonghuSelect").change(function(e) {
                        yonghuSelectOne(e.target.value);
                });
            }

        }



    // 下拉框选项回显
    function setSelectOption() {

        <!-- 当前表的下拉框回显 -->
        var jingdainOrderTypesSelect = document.getElementById("jingdainOrderTypesSelect");
        if(jingdainOrderTypesSelect != null && jingdainOrderTypesOptions != null  && jingdainOrderTypesOptions.length > 0 ) {
            for (var i = 0; i < jingdainOrderTypesOptions.length; i++) {
                if (jingdainOrderTypesOptions[i].codeIndex == ruleForm.jingdainOrderTypes) {//下拉框value对比,如果一致就赋值汉字
                        jingdainOrderTypesSelect.options[i].selected = true;
                }
            }
        }
        <!--  级联表的下拉框回显  -->
            var jingdainSelect = document.getElementById("jingdainSelect");
            if(jingdainSelect != null && jingdainOptions != null  && jingdainOptions.length > 0 ) {
                for (var i = 0; i < jingdainOptions.length; i++) {
                    if (jingdainOptions[i].id == ruleForm.jingdainId) {//下拉框value对比,如果一致就赋值汉字
                        jingdainSelect.options[i+1].selected = true;
                        $("#jingdainSelect" ).selectpicker('refresh');
                    }
                }
            }
            var yonghuSelect = document.getElementById("yonghuSelect");
            if(yonghuSelect != null && yonghuOptions != null  && yonghuOptions.length > 0 ) {
                for (var i = 0; i < yonghuOptions.length; i++) {
                    if (yonghuOptions[i].id == ruleForm.yonghuId) {//下拉框value对比,如果一致就赋值汉字
                        yonghuSelect.options[i+1].selected = true;
                        $("#yonghuSelect" ).selectpicker('refresh');
                    }
                }
            }
    }


    // 填充富文本框
    function setContent() {

        <!-- 当前表的填充富文本框 -->
    }
    // 获取富文本框内容
    function getContent() {
        <!-- 获取当前表的富文本框内容 -->
    }
    function jiaofei() {
        window.location.href = "../../pay.jsp";
    }
    function exit() {
        window.sessionStorage.removeItem("updateId");
        window.sessionStorage.removeItem('addjingdainOrder');
        window.location.href = "list.jsp";
    }
    // 表单校验
    function validform() {
        return $("#addOrUpdateForm").validate({
            rules: {
                jingdainOrderUuidNumber: "required",
                jingdainId: "required",
                yonghuId: "required",
                buyNumber: "required",
                jingdainOrderTime: "required",
                jingdainOrderTruePrice: "required",
                jingdainOrderTypes: "required",
            },
            messages: {
                jingdainOrderUuidNumber: "订单编号不能为空",
                jingdainId: "景点不能为空",
                yonghuId: "用户不能为空",
                buyNumber: "购买数量不能为空",
                jingdainOrderTime: "预约时间不能为空",
                jingdainOrderTruePrice: "实付价格不能为空",
                jingdainOrderTypes: "订单类型不能为空",
            }
        }).form();
    }

    // 获取当前详情
    function getDetails() {
        var addjingdainOrder = window.sessionStorage.getItem("addjingdainOrder");
        if (addjingdainOrder != null && addjingdainOrder != "" && addjingdainOrder != "null") {
            //注册表单验证
            $(validform());
            $("#jingdainOrderUuidNumber").val(new Date().getTime()+Math.ceil(Math.random()*10));//设置唯一号

            $('#submitBtn').text('新增');

        } else {
            $('#submitBtn').text('修改');
            if(window.sessionStorage.getItem('accountTableName') =='jingdainOrder'){
                updateId = window.sessionStorage.getItem('userId');//登录用户查看自己的信息
            }else{
                updateId = window.sessionStorage.getItem('updateId');//获取修改传过来的id
            }
            window.sessionStorage.removeItem('updateId');
            http("jingdainOrder/info/" + updateId, "GET", {}, (res) => {
                if(res.code == 0)
                {
                    ruleForm = res.data
                    // 是/否下拉框回显
                    setSelectOption();
                    // 设置图片src
                    showImg();
                    // 设置视频src
                    showVideo();
                    // 数据填充
                    dataBind();
                    // 富文本框回显
                    setContent();
                    //注册表单验证
                    $(validform());
                }

            });
        }
    }

    // 清除可能会重复渲染的selection
    function clear(className) {
        var elements = document.getElementsByClassName(className);
        for (var i = elements.length - 1; i >= 0; i--) {
            elements[i].parentNode.removeChild(elements[i]);
        }
    }

    function dateTimePick() {

    }


    function dataBind() {


    <!--  级联表的数据回显  -->
        jingdainDataBind();
        yonghuDataBind();


    <!--  当前表的数据回显  -->
        $("#updateId").val(ruleForm.id);
        $("#jingdainOrderUuidNumber").val(ruleForm.jingdainOrderUuidNumber);
        $("#jingdainId").val(ruleForm.jingdainId);
        $("#yonghuId").val(ruleForm.yonghuId);
        $("#buyNumber").val(ruleForm.buyNumber);
        $("#jingdainOrderTime-input").val(ruleForm.jingdainOrderTime);
        $("#jingdainOrderTruePrice").val(ruleForm.jingdainOrderTruePrice);

    }
    <!--  级联表的数据回显  -->
    function jingdainDataBind(){

                    <!-- 把id赋值给当前表的id-->
        $("#jingdainId").val(ruleForm.id);

        $("#jingdainName").val(ruleForm.jingdainName);
        $("#jingdainUuidNumber").val(ruleForm.jingdainUuidNumber);
        $("#jingdainAddress").val(ruleForm.jingdainAddress);
        $("#zanNumber").val(ruleForm.zanNumber);
        $("#caiNumber").val(ruleForm.caiNumber);
        $("#jingdainValue").val(ruleForm.jingdainValue);
        $("#jingdainKucunNumber").val(ruleForm.jingdainKucunNumber);
        $("#jingdainNewMoney").val(ruleForm.jingdainNewMoney);
        $("#jingdainClicknum").val(ruleForm.jingdainClicknum);
        $("#jingdainContent").val(ruleForm.jingdainContent);
    }

    function yonghuDataBind(){

                    <!-- 把id赋值给当前表的id-->
        $("#yonghuId").val(ruleForm.id);

        $("#yonghuUuidNumber").val(ruleForm.yonghuUuidNumber);
        $("#yonghuName").val(ruleForm.yonghuName);
        $("#yonghuPhone").val(ruleForm.yonghuPhone);
        $("#yonghuIdNumber").val(ruleForm.yonghuIdNumber);
        $("#newMoney").val(ruleForm.newMoney);
        $("#yonghuEmail").val(ruleForm.yonghuEmail);
    }


    //图片显示
    function showImg() {
        <!--  当前表的图片  -->

        <!--  级联表的图片  -->
        jingdainShowImg();
        yonghuShowImg();
    }


    <!--  级联表的图片  -->

    function jingdainShowImg() {
        $("#jingdainPhotoImg").attr("src",baseUrl+ruleForm.jingdainPhoto);
    }


    function yonghuShowImg() {
        $("#yonghuPhotoImg").attr("src",baseUrl+ruleForm.yonghuPhoto);
    }



    //视频回显
    function showVideo() {
    <!--  当前表的视频  -->

    <!--  级联表的视频  -->
        jingdainShowVideo();
        yonghuShowVideo();
    }


    <!--  级联表的视频  -->

    function jingdainShowVideo() {
        $("#jingdainPhotoV").attr("src",baseUrl+ruleForm.jingdainPhoto);
    }

    function yonghuShowVideo() {
        $("#yonghuPhotoV").attr("src",baseUrl+ruleForm.yonghuPhoto);
    }



    $(document).ready(function () {
        //设置右上角用户名
        $('.dropdown-menu h5').html(window.sessionStorage.getItem('username'))
        //设置项目名
        $('.sidebar-header h3 a').html(projectName)
        //设置导航栏菜单
        setMenu();
        $('#exitBtn').on('click', function (e) {
            e.preventDefault();
            exit();
        });
        //初始化时间插件
        dateTimePick();
        //查询所有下拉框
            <!--  当前表的下拉框  -->
            jingdainOrderTypesSelect();

            <!-- 查询级联表的下拉框(用id做option,用名字及其他参数做名字级联修改) -->
            jingdainSelect();
            yonghuSelect();



        // 初始化下拉框
            <!--  初始化当前表的下拉框  -->
            initializationJingdainOrderTypesSelect();
            <!--  初始化级联表的下拉框  -->
            initializationjingdainSelect();
            initializationyonghuSelect();

        $(".selectpicker" ).selectpicker('refresh');
        getDetails();
        //初始化上传按钮
        upload();
    <%@ include file="../../static/myInfo.js"%>
                $('#submitBtn').on('click', function (e) {
                    e.preventDefault();
                    //console.log("点击了...提交按钮");
                    submit();
                });
        readonly();
        window.sessionStorage.removeItem('addjingdainOrder');
    });

    function readonly() {
        $('#jingdainOrderUuidNumber').attr('readonly', 'readonly');
        if (window.sessionStorage.getItem('role') == '管理员') {
            //$('#jifen').attr('readonly', 'readonly');
            //$('#role').attr('style', 'pointer-events:none;width:450px;');
        }
		else if (window.sessionStorage.getItem('role') == '用户') {
            // $(".aaaaaa").remove();
            $(".yonghu").remove();//删除当前用户的信息
            if(sessionTable=="jingdainOrder"){//个人中心修改
            }
        }
		else if (window.sessionStorage.getItem('role') == '商家') {
            $('#shangjiaXingjiTypesSelect').attr('style', 'pointer-events: none;');
            // $(".aaaaaa").remove();
            $(".shangjia").remove();//删除当前用户的信息
            if(sessionTable=="jingdainOrder"){//个人中心修改
            }
        }
        else{
            // alert("未知情况.......");
            // var replyTextUeditor = UE.getEditor('replyTextEditor');
            // replyTextUeditor.ready(function () {
            //     replyTextUeditor.setDisabled('fullscreen');
            // });
        }
    }


        layui.use(['layer' , 'jquery' , 'laydate'], function() {
            var layer = layui.layer;
            var jquery = layui.jquery;
            var laydate = layui.laydate;

        var jingdainOrderTime = laydate.render({
            elem: '#jingdainOrderTime-input'
            ,type: 'datetime'
        });
        var insertTime = laydate.render({
            elem: '#insertTime-input'
            ,type: 'datetime'
        });
			// layui.layer.msg("输入不合法", {time: 2000,icon: 5});
			//    5失败 6成功
        });


        //比较大小
        function compare() {
            var largerVal = null;
            var smallerVal = null;
            if (largerVal != null && smallerVal != null) {
                if (largerVal <= smallerVal) {
                    alert(smallerName + '不能大于等于' + largerName);
                    return false;
                }
            }
            return true;
        }
    // 用户登出
    <%@ include file="../../static/logout.jsp"%>
</script>
</body>

</html>
