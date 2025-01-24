<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">

<head>
    <%@ include file="../../static/head.jsp" %>
    <!-- font-awesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">


    <link href="${pageContext.request.contextPath}/resources/css/bootstrap-select.css" rel="stylesheet">
</head>
<style>

</style>
<body>
    <div class="modal fade" id="plusOrReduceShangpinKucunNumberModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <%-- 模态框标题--%>
                <div class="modal-header">
                    <h5 class="modal-title" id="plusOrReduceShangpinKucunNumberTitle">增加或减少库存</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <%-- 模态框内容 --%>
                <div class="modal-body">
                    数量:<input type="number" id="plusOrReduceShangpinKucunNumber" style="width: 300px;" class="form-control form-control-sm"
                              placeholder="数量" aria-controls="tableId" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
                    <input type="hidden" id="shangpinId">
                    <input type="hidden" id="hideflag">
                    <input type="hidden" id="thisShangpinKucunNumber">
                </div>
                <%-- 模态框按钮 --%>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" onclick="submitPlusOrReduceShangpinKucunNumber()" class="btn btn-primary">提交</button>
                </div>
            </div>
        </div>
    </div>


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
                        <ul id="navUl" class="navbar-nav mr-auto">
                        </ul>
                    </div>
                </nav>
            </div>
            <!-- /Menu -->
            <!-- Breadcrumb -->
            <!-- Page Title -->
            <div class="container mt-0">
                <div class="row breadcrumb-bar">
                    <div class="col-md-6">
                        <h3 class="block-title">商品管理</h3>
                    </div>
                    <div class="col-md-6">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="${pageContext.request.contextPath}/index.jsp">
                                    <span class="ti-home"></span>
                                </a>
                            </li>
                            <li class="breadcrumb-item">商品管理</li>
                            <li class="breadcrumb-item active">商品列表</li>
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
                            <h3 class="widget-title">商品列表</h3>
                            <div class="table-responsive mb-3" id="tableDiv">
                                <div class="col-sm-12">
                                                                                                             
                                        <label>商品名称</label>
                                        <input type="text" id="shangpinNameSearch" placeholder="请输入商品名称" aria-controls="tableId" class="form-control form-control-sm">
                                                                                                                                                                                                                         
                                        <label>商品类型</label>
                                        <select name="shangpinTypesSelectSearch" id="shangpinTypesSelectSearch" aria-controls="tableId" class="form-control form-control-sm"></select>
                                                                                                                                                                                                                                                            
                                                                                                         
                                        <label>商家名称</label>
                                        <input type="text" id="shangjiaNameSearch" placeholder="请输入商家名称" aria-controls="tableId" class="form-control form-control-sm">
                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <button onclick="search()" type="button" class="btn btn-primary">查询</button>
                                        <button onclick="add()" type="button" class="btn btn-primary 新增">添加</button>
                                        <button onclick="chartDialog()" type="button" class="btn btn-primary 报表">报表</button>
                                        <span class="导入导出">
                                            导入<input name="file" id="shangpinExcelFile" type="file" class="btn btn-success" style="width: 70px!important; line-height: 35px;">
                                            <button class="btn btn-success" onclick="download('/upload/shangpinMuBan.xls')">导入模板下载</button>
                                        </span>
                                        <button onclick="exportExcel()" type="button" class="btn btn-success 导入导出"><i class="fa fa-file-excel-o" aria-hidden="true"></i>导出</button>
                                        <button onclick="deleteMore()" type="button" class="btn btn-danger 删除">批量删除</button>
                                </div>
                                <table id="tableId" class="table table-bordered table-striped">
                                    <thead>
                                    <tr>
                                        <th class="no-sort" style="min-width: 35px;">
                                            <div class="custom-control custom-checkbox">
                                                <input class="custom-control-input" type="checkbox" id="select-all"
                                                       onclick="chooseAll()">
                                                <label class="custom-control-label" for="select-all"></label>
                                            </div>
                                        </th>

                                        <th>商家名称<i id="shangjiaNameIcon"></i></th>
                                        <th onclick="sort('shangpin_name')">商品名称<i id="shangpinNameIcon" class="fa fa-sort"></i></th>
                                        <th onclick="sort('shangpin_uuid_number')">商品编号<i id="shangpinUuidNumberIcon" class="fa fa-sort"></i></th>
                                        <th onclick="sort('shangpin_photo')">商品照片<i id="shangpinPhotoIcon" class="fa fa-sort"></i></th>
                                        <th onclick="sort('shangpin_address')">商品地点<i id="shangpinAddressIcon" class="fa fa-sort"></i></th>
                                        <th onclick="sort('zan_number')">赞<i id="zanNumberIcon" class="fa fa-sort"></i></th>
                                        <th onclick="sort('cai_number')">踩<i id="caiNumberIcon" class="fa fa-sort"></i></th>
                                        <th onclick="sort('shangpin_types')">商品类型<i id="shangpinTypesIcon" class="fa fa-sort"></i></th>
                                        <th onclick="sort('shangpin_kucun_number')">商品库存<i id="shangpinKucunNumberIcon" class="fa fa-sort"></i></th>
                                        <th onclick="sort('shangpin_new_money')">金额<i id="shangpinNewMoneyIcon" class="fa fa-sort"></i></th>
                                        <th onclick="sort('shangpin_clicknum')">商品热度<i id="shangpinClicknumIcon" class="fa fa-sort"></i></th>
                                        <th onclick="sort('insert_time')">录入时间<i id="insertTimeIcon" class="fa fa-sort"></i></th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody id="thisTbody">
                                    </tbody>
                                </table>
                                <div class="col-md-6 col-sm-3" style="flex:none;max-width:inherit;display:flex;">
                                    <div class="dataTables_length" id="tableId_length">
                                        <select name="tableId_length" aria-controls="tableId" id="selectPageSize" onchange="changePageSize()">
                                            <option value="10">10</option>
                                            <option value="25">25</option>
                                            <option value="50">50</option>
                                            <option value="100">100</option>
                                        </select>
                                       <span class="text">条每页</span>
                                    </div>
                                    <nav aria-label="Page navigation example">
                                        <ul class="pagination justify-content-end">
                                            <li class="page-item" id="tableId_previous" onclick="pageNumChange('pre')"> <a class="page-link" href="#" tabindex="-1">上一页</a></li>
                                            <li class="page-item" id="tableId_next" onclick="pageNumChange('next')"> <a class="page-link" href="#">下一页</a></li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /Widget Item -->
                </div>
            </div>
            <!-- /Main Content -->

        </div>
        <!-- /Page Content -->
    </div>
    <div class="modal fade" style="margin-left: -700px" id="chartVisiable" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="z-index: 3000">
            <div class="modal-content" style="width: 1300px;">
                <div class="modal-header">
                    <h5 class="modal-title">报表模态框</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div style="display: flex;" class="form-row row">
                            <!--<label>条件a：</label>
                            <select id="tiaojian111Types" style="width: 300px" name="tiaojian111Types" class="form-control">
                                <option value="1">条件1</option>
                                <option value="2">条件2</option>
                            </select>-->
                            <label>年月</label>
                            <input type="text" id="echartsDate" style="width: 300px" placeholder="请选择年"  class="form-control form-control-sm">
                        <button onclick="chartDialog()" type="button" class="btn btn-primary">查询</button>
                    </div>
                    <div id="statistic" style="width:1200px;height:600px;"></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭模态框</button>
                </div>
            </div>
        </div>
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

    <script language="javascript" type="text/javascript"
            src="${pageContext.request.contextPath}/resources/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/js/bootstrap-select.js"></script>
    <script language="javascript" type="text/javascript"
            src="${pageContext.request.contextPath}/resources/js/excel/excel-gen.js"></script>
    <script language="javascript" type="text/javascript"
            src="${pageContext.request.contextPath}/resources/js/excel/jszip.min.js"></script>
    <script language="javascript" type="text/javascript"
            src="${pageContext.request.contextPath}/resources/js/excel/FileSaver.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/echarts.min.js"></script>
    <script>

        <%@ include file="../../utils/menu.jsp"%>
        <%@ include file="../../static/setMenu.js"%>
        <%@ include file = "../../static/utils.js" %>
        <%@ include file="../../utils/baseUrl.jsp"%>
        <%@ include file="../../static/getRoleButtons.js"%>
        <%@ include file="../../static/crossBtnControl.js"%>
        var sessionTable = window.sessionStorage.getItem("accountTableName");//登录账户所在表名
        var role         = window.sessionStorage.getItem("role");//权限
        var userId       = window.sessionStorage.getItem("userId");//当前登录人的id
        var tableName = "shangpin";
        var pageType = "list";
        var searchForm = {key: ""};
        var pageIndex = 1;
        var pageSize = 10;
        var totalPage = 0;
        var dataList = [];
        var sortColumn = 'id';
        var sortOrder = 'desc';
        var ids = [];
        var checkAll = false;

        <!-- 级联表的级联字典表 -->

        <!-- 本表的级联字段表 -->
        var shangpinTypesOptions = [];

        function init() {
            // 满足条件渲染提醒接口
        }

        // 改变每页记录条数
        function changePageSize() {
            var selection = document.getElementById('selectPageSize');
            var index = selection.selectedIndex;
            pageSize = selection.options[index].value;
            getDataList();
        }

        //排序
        function sort(columnName) {
            var iconId = '#' + columnName + 'Icon'
            $('th i').attr('class', 'fa fa-sort');
            if (sortColumn == '' || sortColumn != columnName) {
                sortColumn = columnName;
                sortOrder = 'asc';
                $(iconId).attr('class', 'fa fa-sort-asc');
            }
            if (sortColumn == columnName) {
                if (sortOrder == 'asc') {
                    sortOrder = 'desc';
                    $(iconId).attr('class', 'fa fa-sort-desc');
                } else {
                    sortOrder = 'asc';
                    $(iconId).attr('class', 'fa fa-sort-asc');
                }
            }
            pageIndex = 1;
            getDataList();
        }



        // 查询
        function search() {
            searchForm = {key: ""};

        <!-- 级联表的级联字典表 -->
                                         
                            //商家名称
            var shangjiaNameSearchInput = $('#shangjiaNameSearch');
            if( shangjiaNameSearchInput != null){
                if (shangjiaNameSearchInput.val() != null && shangjiaNameSearchInput.val() != '') {
                    searchForm.shangjiaName = $('#shangjiaNameSearch').val();
                }
            }
                                                                                                                                                                    <!-- 本表的查询条件 -->

             
            //商品名称
            var shangpinNameSearchInput = $('#shangpinNameSearch');
            if( shangpinNameSearchInput != null){
                if (shangpinNameSearchInput.val() != null && shangpinNameSearchInput.val() != '') {
                    searchForm.shangpinName = $('#shangpinNameSearch').val();
                }
            }
                         
                //商品类型
            var shangpinTypesSelectSearchInput = document.getElementById("shangpinTypesSelectSearch");
            if(shangpinTypesSelectSearchInput != null){
                var shangpinTypesIndex = shangpinTypesSelectSearchInput.selectedIndex;
                if( shangpinTypesIndex  != 0){
                    searchForm.shangpinTypes= document.getElementById("shangpinTypesSelectSearch").options[shangpinTypesIndex].value;
                }
            }
                                        getDataList();
        }

        // 获取数据列表
        function getDataList() {
            http("shangpin/page", "GET", {
                page: pageIndex,
                limit: pageSize,
                sort: sortColumn,//字段
                order: sortOrder,//asc desc
                shangpinDelete: 1,
                //本表的
                shangpinName: searchForm.shangpinName,
                shangpinTypes: searchForm.shangpinTypes,
            //级联表的
                shangjiaName: searchForm.shangjiaName,

            }, (res) => {
                getRoleButtons();// 权限按钮控制
                if(res.code == 0) {
                    clear();
                    $("#thisTbody").html("");
                    getRoleButtons();// 权限按钮控制
                    dataList = res.data.list;
                    totalPage = res.data.totalPage;
                    for (var i = 0; i < dataList.length; i++) { //遍历一下表格数据
                        var trow = setDataRow(dataList[i], i); //定义一个方法,返回tr数据
                        $('#thisTbody').append(trow);
                    }
                    pagination(); //渲染翻页组件
                    getRoleButtons();// 权限按钮控制
                }
            });
        }

        // 渲染表格数据
        function setDataRow(item, number) {
            //创建行
            var row = document.createElement('tr');
            row.setAttribute('class', 'useOnce');
            //创建勾选框
            var checkbox = document.createElement('td');
            var checkboxDiv = document.createElement('div');
            checkboxDiv.setAttribute("class", "custom-control custom-checkbox");
            var checkboxInput = document.createElement('input');
            checkboxInput.setAttribute("class", "custom-control-input");
            checkboxInput.setAttribute("type", "checkbox");
            checkboxInput.setAttribute('name', 'chk');
            checkboxInput.setAttribute('value', item.id);
            checkboxInput.setAttribute("id", number);
            checkboxDiv.appendChild(checkboxInput);
            var checkboxLabel = document.createElement('label');
            checkboxLabel.setAttribute("class", "custom-control-label");
            checkboxLabel.setAttribute("for", number);
            checkboxDiv.appendChild(checkboxLabel);
            checkbox.appendChild(checkboxDiv);
            row.appendChild(checkbox)


                    //商家名称
            var shangjiaNameCell = document.createElement('td');
            shangjiaNameCell.innerHTML = item.shangjiaName;
            row.appendChild(shangjiaNameCell);


            //商品名称
            var shangpinNameCell = document.createElement('td');
            shangpinNameCell.innerHTML = item.shangpinName;
            row.appendChild(shangpinNameCell);


            //商品编号
            var shangpinUuidNumberCell = document.createElement('td');
            shangpinUuidNumberCell.innerHTML = item.shangpinUuidNumber;
            row.appendChild(shangpinUuidNumberCell);

                //商品照片
            var shangpinPhotoCell = document.createElement('td');
            var shangpinPhotoImg = document.createElement('img');
            var shangpinPhotoImgValue = baseUrl+item.shangpinPhoto;
            if(shangpinPhotoImgValue !=null && shangpinPhotoImgValue !='' && shangpinPhotoImgValue !='null'){
                shangpinPhotoImg.setAttribute('src', shangpinPhotoImgValue);
                shangpinPhotoImg.setAttribute('height', 100);
                shangpinPhotoImg.setAttribute('width', 100);
                shangpinPhotoCell.appendChild(shangpinPhotoImg);
            }else{
                shangpinPhotoCell.innerHTML = "暂无图片";
            }
            row.appendChild(shangpinPhotoCell);

            //商品地点
            var shangpinAddressCell = document.createElement('td');
            shangpinAddressCell.innerHTML = item.shangpinAddress;
            row.appendChild(shangpinAddressCell);


            //赞
            var zanNumberCell = document.createElement('td');
            zanNumberCell.innerHTML = item.zanNumber;
            row.appendChild(zanNumberCell);


            //踩
            var caiNumberCell = document.createElement('td');
            caiNumberCell.innerHTML = item.caiNumber;
            row.appendChild(caiNumberCell);


            //商品类型
            var shangpinTypesCell = document.createElement('td');
            shangpinTypesCell.innerHTML = item.shangpinValue;
            row.appendChild(shangpinTypesCell);


            //商品库存
            var shangpinKucunNumberCell = document.createElement('td');
            shangpinKucunNumberCell.innerHTML = item.shangpinKucunNumber;
            row.appendChild(shangpinKucunNumberCell);


            //金额
            var shangpinNewMoneyCell = document.createElement('td');
            shangpinNewMoneyCell.innerHTML = item.shangpinNewMoney;
            row.appendChild(shangpinNewMoneyCell);


            //商品热度
            var shangpinClicknumCell = document.createElement('td');
            shangpinClicknumCell.innerHTML = item.shangpinClicknum;
            row.appendChild(shangpinClicknumCell);


            //录入时间
            var insertTimeCell = document.createElement('td');
            insertTimeCell.innerHTML = item.insertTime;
            row.appendChild(insertTimeCell);



            //每行按钮
            var btnGroup = document.createElement('td');

            //详情按钮
            var detailBtn = document.createElement('button');
            var detailAttr = "detail(" + item.id + ')';
            detailBtn.setAttribute("type", "button");
            detailBtn.setAttribute("class", "btn btn-info btn-sm 查看");
            detailBtn.setAttribute("onclick", detailAttr);
            detailBtn.innerHTML = "查看";
            btnGroup.appendChild(detailBtn);

            if(sessionTable=='wuyong'){
                var tempBtn = document.createElement('button');
                var tempAttr = 'wuyong(' + item.id + ')';
                tempBtn.setAttribute("type", "button");
                tempBtn.setAttribute("class", "btn btn-warning btn-sm");
                tempBtn.setAttribute("onclick", tempAttr);
                tempBtn.innerHTML = "无用";
                btnGroup.appendChild(tempBtn);
            }

            ////增加商品库存
            //var plusBtn = document.createElement('button');
            //var plusAttr = "plusShangpinKucunNumber(" + item.id+','+item.shangpinKucunNumber+")";
            //plusBtn.setAttribute("type", "button");
            //plusBtn.setAttribute("class", "btn btn-info btn-sm 出入库");
            //plusBtn.setAttribute("onclick", plusAttr);
            //plusBtn.innerHTML = "增加商品库存";
            //btnGroup.appendChild(plusBtn);

            //var reduceBtn = document.createElement('br');
            //btnGroup.appendChild(reduceBtn);

            ////减少商品库存
            //var reduceBtn = document.createElement('button');
            //var reduceAttr = "reduceShangpinKucunNumber(" + item.id+','+item.shangpinKucunNumber+')';
            //reduceBtn.setAttribute("type", "button");
            //reduceBtn.setAttribute("class", "btn btn-info btn-sm 出入库");
            //reduceBtn.setAttribute("onclick", reduceAttr);
            //reduceBtn.innerHTML = "减少商品库存";
            //btnGroup.appendChild(reduceBtn);





            //修改按钮
            var editBtn = document.createElement('button');
            var editAttr = 'edit(' + item.id + ')';
            editBtn.setAttribute("type", "button");
            editBtn.setAttribute("class", "btn btn-warning btn-sm 修改");
            editBtn.setAttribute("onclick", editAttr);
            editBtn.innerHTML = "修改";
            btnGroup.appendChild(editBtn);



            //删除按钮
            var deleteBtn = document.createElement('button');
            var deleteAttr = 'remove(' + item.id + ')';
            deleteBtn.setAttribute("type", "button");
            deleteBtn.setAttribute("class", "btn btn-danger btn-sm 删除");
            deleteBtn.setAttribute("onclick", deleteAttr);
            deleteBtn.innerHTML = "删除";
            btnGroup.appendChild(deleteBtn);

            row.appendChild(btnGroup);

            return row;
    }




        // 翻页
        function pageNumChange(val) {
            if (val == 'pre') {
                pageIndex--;
            } else if (val == 'next') {
                pageIndex++;
            } else {
                pageIndex = val;
            }
            getDataList();
        }

        // 下载
        function download(url) {
            window.open(baseUrl+url);
        }
        // 打开新窗口播放媒体
        function mediaPlay(url){
            window.open(baseUrl+url);
        }

        /*导入*/
        function upload() {
            /*导入数据*/
            $('#shangpinExcelFile').fileupload({
                url: baseUrl + 'file/upload',
                headers: {token: window.sessionStorage.getItem("token")},
                dataType: "json",
                done: function (e, data) {
                    http("shangpin/batchInsert?fileName="+data.result.file, "get", {} , (res) => {
                        if(res.code == 0){
                            layui.layer.msg("操作成功", {time: 2000,icon: 6});
                        }
                    });
                }
            });
        }

        // 渲染翻页组件
        function pagination() {
            var beginIndex = pageIndex;
            var endIndex = pageIndex;
            var point = 4;
            //计算页码
            for (var i = 0; i < 3; i++) {
                if (endIndex == totalPage) {
                    break;
                }
                endIndex++;
                point--;
            }
            for (var i = 0; i < 3; i++) {
                if (beginIndex == 1) {
                    break;
                }
                beginIndex--;
                point--;
            }
            if (point > 0) {
                while (point > 0) {
                    if (endIndex == totalPage) {
                        break;
                    }
                    endIndex++;
                    point--;
                }
                while (point > 0) {
                    if (beginIndex == 1) {
                        break;
                    }
                    beginIndex--;
                    point--
                }
            }
            // 是否显示 前一页 按钮
            if (pageIndex > 1) {
                $('#tableId_previous').show();
            } else {
                $('#tableId_previous').hide();
            }
            // 渲染页码按钮
            for (var i = beginIndex; i <= endIndex; i++) {
                var pageNum = document.createElement('li');
                pageNum.setAttribute('onclick', "pageNumChange(" + i + ")");
                if (pageIndex == i) {
                    pageNum.setAttribute('class', 'paginate_button page-item active useOnce');
                } else {
                    pageNum.setAttribute('class', 'paginate_button page-item useOnce');
                }
                var pageHref = document.createElement('a');
                pageHref.setAttribute('class', 'page-link');
                pageHref.setAttribute('href', '#');
                pageHref.setAttribute('aria-controls', 'tableId');
                pageHref.setAttribute('data-dt-idx', i);
                pageHref.setAttribute('tabindex', 0);
                pageHref.innerHTML = i;
                pageNum.appendChild(pageHref);
                $('#tableId_next').before(pageNum);
            }
            // 是否显示 下一页 按钮
            if (pageIndex < totalPage) {
                $('#tableId_next').show();
                $('#tableId_next a').attr('data-dt-idx', endIndex + 1);
            } else {
                $('#tableId_next').hide();
            }
            var pageNumInfo = "当前第 " + pageIndex + " 页，共 " + totalPage + " 页";
            $('#tableId_info').html(pageNumInfo);
        }

        // 跳转到指定页
        function toThatPage() {
            //var index = document.getElementById('pageIndexInput').value;
            if (index < 0 || index > totalPage) {
                layui.layer.msg('请输入正确的页码', {time: 2000,icon: 5});
            } else {
                pageNumChange(index);
            }
        }

        // 全选/全不选
        function chooseAll() {
            checkAll = !checkAll;
            var boxs = document.getElementsByName("chk");
            for (var i = 0; i < boxs.length; i++) {
                boxs[i].checked = checkAll;
            }
        }

        // 批量删除
        function deleteMore() {
            ids = []
            var boxs = document.getElementsByName("chk");
            for (var i = 0; i < boxs.length; i++) {
                if (boxs[i].checked) {
                    ids.push(boxs[i].value)
                }
            }
            if (ids.length == 0) {
                layui.layer.msg('请勾选要删除的记录', {time: 2000,icon: 5});
            } else {
                remove(ids);
            }
        }

        // 删除
        function remove(id) {
            var mymessage = confirm("真的要删除吗？");
            if (mymessage == true) {
                var paramArray = [];
                if (id == ids) {
                    paramArray = id;
                } else {
                    paramArray.push(id);
                }
                httpJson("shangpin/delete", "POST", paramArray, (res) => {
                    if(res.code == 0){
                        getDataList();
                        layui.layer.msg("删除成功", {time: 2000,icon: 6});
                    }
                });
            } else {
                layui.layer.msg('已取消操作', {time: 2000,icon: 5});
            }
        }
        function wuyong(id) {
            var mymessage = confirm("确定 了么？");
            if (mymessage == true) {
                httpJson("shangpin/update", "POST", {
                    id:id,
                    shangpinTypes:2
                }, (res) => {
                    if(res.code == 0){
                        getDataList();
                        layui.layer.msg("操作成功", {time: 2000,icon: 6});
                    }
                });
            }
        }

        // 用户登出
        <%@ include file="../../static/logout.jsp"%>

        //修改
        function edit(id) {
            window.sessionStorage.setItem('updateId', id)
            window.location.href = "add-or-update.jsp"
        }

        //清除会重复渲染的节点
        function clear() {
            var elements = document.getElementsByClassName('useOnce');
            for (var i = elements.length - 1; i >= 0; i--) {
                elements[i].parentNode.removeChild(elements[i]);
            }
        }

        //添加
        function add() {
            window.sessionStorage.setItem("addshangpin", "addshangpin");
            window.location.href = "add-or-update.jsp"
        }
        function exportExcel() {
            excel = new ExcelGen({
                "src_id": "tableId",
                "show_header": true,
                "file_name": 'shangpin.xlsx'
            });
            excel.generate();
        }

        // 查看详情
        function detail(id) {
            window.sessionStorage.setItem("updateId", id);
            window.location.href = "info.jsp";
        }


    //填充级联表搜索下拉框
                                         
                                                                                                                                                                
    //填充本表搜索下拉框
             
                         
        function shangpinTypesSelectSearch() {
            var shangpinTypesSelectSearch = document.getElementById('shangpinTypesSelectSearch');
            if(shangpinTypesSelectSearch != null) {
                shangpinTypesSelectSearch.add(new Option('-请选择-',''));
                if (shangpinTypesOptions != null && shangpinTypesOptions.length > 0){
                    for (var i = 0; i < shangpinTypesOptions.length; i++) {
                            shangpinTypesSelectSearch.add(new Option(shangpinTypesOptions[i].indexName,shangpinTypesOptions[i].codeIndex));
                    }
                }
            }
        }
                            
    //查询级联表搜索条件所有列表

    //查询当前表搜索条件所有列表
            function shangpinTypesSelect() {
                //填充下拉框选项
                http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=shangpin_types", "GET", {}, (res) => {
                    if(res.code == 0){
                        shangpinTypesOptions = res.data.list;
                    }
                });
            }





        //增加商品库存
        function plusShangpinKucunNumber(thisId,shangpinKucunNumber) {
            if(thisId == null || thisId=="" || thisId=="null"){
                alert("未知错误,请联系管理员处理");
                return;
            }
            $("#plusOrReduceShangpinKucunNumberTitle").val("增加商品库存");
            $("#thisShangpinKucunNumber").val(shangpinKucunNumber);
            $("#hideflag").val("+");
            $("#shangpinId").val(thisId);
            id=thisId;
            $('#plusOrReduceShangpinKucunNumberModal').modal('show');
        }

        //减少商品库存
        function reduceShangpinKucunNumber(thisId,shangpinKucunNumber) {
            if(thisId == null || thisId=="" || thisId=="null"){
                alert("未知错误,请联系管理员处理");
                return;
            }
            $("#plusOrReduceShangpinKucunNumberTitle").val("减少商品库存");
            $("#thisShangpinKucunNumber").val(shangpinKucunNumber);
            $("#hideflag").val("-");
            $("#shangpinId").val(thisId);
            id=thisId;
            $('#plusOrReduceShangpinKucunNumberModal').modal('show');
        }
        $('#plusOrReduceShangpinKucunNumberModal').on('show.bs.modal', function () {
            //清理表格内容,防止重复回显
            $("#plusOrReduceShangpinKucunNumber").val(0);
            if(id ==null){
                alert("获取当前列id错误,请联系管理员处理");
                $('#plusOrReduceShangpinKucunNumberModal').modal('hide');
                $("#plusOrReduceShangpinKucunNumberTitle").val("");
                $("#thisShangpinKucunNumber").val("");
                $("#hideflag").val("");
                $("#shangpinId").val("");
                getDataList();
                return;
            }
        });
        //模态框关闭的时候会执行这个里面的东西
        $('#plusOrReduceShangpinKucunNumberModal').on('hide.bs.modal', function () {
            id=null;
            $("#plusOrReduceShangpinKucunNumber").val(0);
            $("#plusOrReduceShangpinKucunNumberTitle").val("");
            $("#thisShangpinKucunNumber").val("");
            $("#hideflag").val("");
            $("#shangpinId").val("");
            getDataList();
        });

        function submitPlusOrReduceShangpinKucunNumber() {
            var id = $("#shangpinId").val();//当前数据id
            var hideflag = $("#hideflag").val();//是加还是减
            var thisShangpinKucunNumber = $("#thisShangpinKucunNumber").val();//原先的数量
            var plusOrReduceShangpinKucunNumber = $("#plusOrReduceShangpinKucunNumber").val();//增加或者减少的数量
            var sumNumber=0;
            var msg;
            if(hideflag == "+"){
                sumNumber =parseInt(thisShangpinKucunNumber) + parseInt(plusOrReduceShangpinKucunNumber);
                msg = "增加商品库存成功";
            }else if(hideflag == "-"){
                sumNumber =parseInt(thisShangpinKucunNumber) - parseInt(plusOrReduceShangpinKucunNumber);
                msg = "减少商品库存成功";
            }else{
                alert("提交商品库存增加减少未知错误");
                return;
            }
            let data = {"id":id,"shangpinKucunNumber":sumNumber};
            httpJson("shangpin/update", "POST", data, (res) => {
                if(res.code == 0){
                    alert(msg);
                    getDataList();
                }else{
                    alert(res.msg);
                }
                $('#plusOrReduceShangpinKucunNumberModal').modal('hide');
            });

        }



// 101 102 103 104 105


            function chartDialog(){
                let echartsDate = $("#echartsDate").val();
                $('#chartVisiable').modal('show');//打开模态框
                //柱状图
                var statistic = echarts.init( document. getElementById( 'statistic'),'macarons');
                http("barSumOne", "GET", {
                    riqi:echartsDate
                }, (res) => {//barCountOne barCountTwo barSumOne barSumTwo
                    if(res && res.code === 0){
                        let yAxisName = "数值";//y轴
                        let xAxisName = "类型";//x轴
                        let series = [];//具体数据值
                        res.data.yAxis.forEach(function (item,index) {//点击可关闭的按钮字符串在后台方法中
                            let tempMap = {};
                            tempMap.name=res.data.legend[index];
                            tempMap.type='bar';
                            tempMap.data=item;
                            series.push(tempMap);
                        })
                        var option = {
                            tooltip: {
                                trigger: 'axis',
                                axisPointer: {
                                    type: 'cross',
                                    crossStyle: {
                                        color: '#999'
                                    }
                                }
                            },
                            toolbox: {
                                feature: {
                                    // dataView: { show: true, readOnly: false },  // 数据查看
                                    magicType: { show: true, type: ['line', 'bar'] },//切换图形展示方式
                                    // restore: { show: true }, // 刷新
                                    saveAsImage: { show: true }//保存
                                }
                            },
                            legend: {
                                data: res.data.legend//标题  可以点击导致某一列数据消失
                            },
                            xAxis: [
                                {
                                    type: 'category',
                                    axisLabel:{interval: 0},
                                    name: xAxisName,
                                    data: res.data.xAxis,
                                    axisPointer: {
                                        type: 'shadow'
                                    }
                                }
                            ],
                            yAxis: [
                                {
                                    type: 'value',//不能改
                                    name: yAxisName,//y轴单位
                                    axisLabel: {
                                        formatter: '{value}' // 后缀
                                    }
                                }
                            ],
                            series:series//具体数据
                        };
                        statistic.setOption(option,true);
                        window.onresize = function () {
                            statistic.resize();
                        };
                    }else {
                        layui.layer.msg("报表未查询到数据", {time: 3000,icon: 5});
                    }
                });
                ////饼状图
                //var statistic = echarts.init( document. getElementById( 'statistic'),'macarons');
                //http("newSelectGroupCount", "GET", {
                //    tableName: "shangpin",
                //    groupColumn: "shangpin_types",
                //    // riqi:echartsDate
                //}, (res) => {//pieSum pieCount
                //    if (res && res.code === 0) {
                //        let data = res.data;
                //        let xAxis = [];
                //        let yAxis = [];
                //        let pArray = []
                //        var option = {};
                //        for(let i=0;i<data.length;i++){
                //            xAxis.push(data[i].name);
                //            yAxis.push(data[i].value);
                //            pArray.push({
                //                value: data[i].value,
                //                name: data[i].name
                //            })
                //            option = {
                //                title: {
                //                    text: '保险合同类型统计',
                //                    left: 'center'
                //                },
                //                tooltip: {
                //                    trigger: 'item',
                //                    formatter: '{b} : {c} ({d}%)'
                //                },
                //                legend: {
                //                    orient: 'vertical',
                //                    left: 'left'
                //                },
                //                series: [
                //                    {
                //                        type: 'pie',
                //                        radius: '55%',
                //                        center: ['50%', '60%'],
                //                        data: pArray,
                //                        emphasis: {
                //                            itemStyle: {
                //                                shadowBlur: 10,
                //                                shadowOffsetX: 0,
                //                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                //                            }
                //                        }
                //                    }
                //                ]
                //            };
                //        }
                //        statistic.setOption(option,true);
                //        window.onresize = function() {
                //            statistic.resize();
                //        };
                //    }
                //});
            }

        layui.use(['layer', 'carousel', 'jquery', 'form', 'upload', 'laydate', 'rate'], function () {
            var rate = layui.rate;//评分
            var laydate  = layui.laydate ;//laydate
            var jquery = layui.jquery;//jquery
            var echartsDate = laydate.render({
                elem: '#echartsDate'
                ,type: 'year'//month
                ,value: new Date()
            });
            var $=jquery;

        });


        $(document).ready(function () {
            //激活翻页按钮
            $('#tableId_previous').attr('class', 'paginate_button page-item previous')
            $('#tableId_next').attr('class', 'paginate_button page-item next')
            //隐藏原生搜索框
            $('#tableId_filter').hide()
            //设置右上角用户名
            $('.dropdown-menu h5').html(window.sessionStorage.getItem('username'))
            //设置项目名
            $('.sidebar-header h3 a').html(projectName)
            setMenu();
            init();

            upload()
            //查询级联表的搜索下拉框

            //查询当前表的搜索下拉框
            shangpinTypesSelect();
            getDataList();

        //级联表的下拉框赋值
                                                 
                                                                                                                                                                                                
        //当前表的下拉框赋值
                                     
                                                                         
            shangpinTypesSelectSearch();
                                                                                    
        <%@ include file="../../static/myInfo.js"%>
    });
</script>
</body>

</html>
