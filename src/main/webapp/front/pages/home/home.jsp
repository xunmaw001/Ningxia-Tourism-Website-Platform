<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="utf-8">
    <title>首页</title>
    <meta name="description" content=""/>
    <meta name="keywords" content=""/>
    <meta name="author" content="order by mobanxiu.cn"/>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" href="../../layui/css/layui.css">
    <link rel="stylesheet" href="../../xznstatic/css/common.css"/>
    <link rel="stylesheet" href="../../xznstatic/css/style.css"/>
    <link rel="stylesheet" href="../../xznstatic/css/animate.css"/><!-- 动画效果 -->
    <link rel="stylesheet" href="../../xznstatic/css/swiper.min.css"/>
    <script src="../../xznstatic/js/jquery-1.11.3.min.js"></script>
    <script src="../../xznstatic/js/jquery.SuperSlide.2.1.1.js"></script>
    <link rel="stylesheet" href="../../xznstatic/css/bootstrap.min.css"/>

    <link rel="stylesheet" href="../../css/theme.css"/>
</head>
<style>
    html::after {
        position: fixed;
        top: 0;
        right: 0;
        left: 0;
        bottom: 0;
        content: '';
        display: block;
        background-attachment: fixed;
        background-size: cover;
        background-position: center;
    }

    #test1 {
        overflow: hidden;
    }

    /*轮播图css*/
    #test1 .layui-carousel-ind li {
        width: 20px;
        height: 10px;
        border-width: 0;
        border-style: solid;
        border-color: rgba(0, 0, 0, .3);
        border-radius: 6px;
        background-color: #f7f7f7;
        box-shadow: 0 0 6px rgba(255, 0, 0, .8);
    }

    #test1 .layui-carousel-ind li.layui-this {
        width: 30px;
        height: 10px;
        border-width: 0;
        border-style: solid;
        border-color: rgba(0, 0, 0, .3);
        border-radius: 6px;
    }

    .layui-carousel-ind{
        top: 0;

    }
    .layui-carousel-ind ul{
        position: absolute;

        bottom: 8px !important;
        z-index: 10;
    }

    .title {
        padding: 10px 5px;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
    }

   .title span {
        padding: 0 10px;
        line-height: 1.4;
    }

   .box .list {
        display: flex;
        flex-wrap: wrap;
    }




    .box .list img {
        width: 100%;
        height: 100px;
        display: block;
        margin: 0 auto;
        object-fit: cover;
        max-width: 100%;
    }

    .box .list .name {
        padding-top: 5px;
        color: red;
        font-size: 14px;
        text-align: center;
        box-sizing: border-box;
    }


    .box .list .list-item {
        flex: 0 0 25%;
        padding: 0 10px;
        box-sizing: border-box;
    }

    /*
   .box .list .list-item-body {
        border: 1px solid rgba(0, 0, 0, 3);
        padding: 5px;
        box-sizing: border-box;
        cursor: pointer;
   }
    .box .list .list-item .list-item-body {
        border: 1px solid rgba(0, 0, 0, 3);
        padding: 10px;
        box-sizing: border-box;
        display: flex;
        cursor: pointer;
    }

    .box .list .list-item .list-item-body img {
        width: 120px;
        height: 100%;
        display: block;
        margin: 0 auto;
        object-fit: cover;
        max-width: 100%;
    }

    .box .list .list-item .list-item-body .item-info {
        flex: 1;
        display: flex;
        justify-content: space-between;
        flex-direction: column;
        padding-left: 10px;
        box-sizing: border-box;
    }

    .box .list .list-item .list-item-body .item-info .name {
        padding-top: 5px;
        color: red;
        font-size: 14px;
        box-sizing: border-box;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 1;
        -webkit-box-orient: vertical;
    }
    .box .list .list-item .list-item-body .item-info .time {
        padding-top: 5px;
        color: red;
        font-size: 14px;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 1;
        -webkit-box-orient: vertical;
    }
    #new-list-6 .swiper-wrapper {
        -webkit-transition-timing-function: linear;
        -moz-transition-timing-function: linear;
        -ms-transition-timing-function: linear;
        -o-transition-timing-function: linear;
        transition-timing-function: linear;
    }*/

    .list-item1 {
        flex: 0 0 100%;
    }
    .list-item2 {
        flex: 0 0 50%;
    }
    .list-item3 {
        flex: 0 0 33.3%;
    }
    .list-item4 {
        flex: 0 0 25%;
    }
    .list-item5 {
        flex: 0 0 20%;
    }
    /*限制内容长度*/
    .line1 {
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 1;
        overflow: hidden;
    }
    .line2 {
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 2;
        overflow: hidden;
    }
    .line3 {
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 3;
        overflow: hidden;
    }
    /*轮播图css*/
    /*套装样式*/
    /*腰线*/
.tox-pop{
    z-index: -99999;
}

.show-reel a img{
    width:100%;
}
.show-reel:nth-child(2){
    margin:2em 0;
}
.agile-gallery{
    position: relative;
    overflow: hidden;
    text-align: center;;
}
.agileits-caption {
    background: rgba(0, 0, 0, 0.62);
    padding: 2em 1em 1em 1em;
    position: absolute;
    left: 0;
    bottom: -105%;
    text-align: center;
    width: 100%;
    height: 100%;
    -webkit-transition: .5s all;
    transition: .5s all;
    -moz-transition: .5s all;
}
.agile-gallery:hover .agileits-caption {
    bottom: 0%;
}
.agileits-caption h4{
    color: #FFFFFF;
    margin: 0 0 .5em 0;
    font-size: 1.5em;
    font-weight: 600;
    font-family: 'Laila', serif;
    line-height: 8em;
    text-transform: capitalize;
}
.agileits-caption p{
    color: #FFFFFF;
    font-size: 1.3em;
    margin-top:  3px;
}
.gallery-grids {
    padding: 5em 0;
}
    /*home页面主要样式*/
    /*home页面普通数据样式*/
    /*home页面新闻数据样式*/
</style>
<body>
<div id="app" >
    <div class="banner">

        <div class="layui-carousel" id="test1" style="height: 800px !important;position: relative;" :style='{"boxShadow":"0 0 0px rgba(255,0,0,.8)","margin":"0 auto","borderColor":"rgba(0,0,0,.3)","borderRadius":"0px","borderWidth":"0","width":"100%","borderStyle":"solid"}'>
            <div carousel-item class="slideInLeft" style="visibility: visible; animation-duration: 3s; animation-name: slideInLeft;height: 800px">
                <div v-for="(item,index) in swiperList" :key="index">
                    <img style="width: 100%;height: 100%;object-fit:cover;" :src="baseUrl+item.img"/>
                </div>
            </div>
        </div>
    </div>

    <div id="content">
                <div style="display: flex;justify-content: center;background-repeat: no-repeat;background-position: center center;background-size: cover;">
                    <div class="box" style='width:100%;'>
                        <div style="width: 1200px;height:auto;margin:  0 auto;padding: 10px 0">
                            <div class="wow " data-wow-duration="2s" data-wow-delay="1s">
<div class="title main_backgroundColor"
     :style='{"padding":"10px 0 10px 10px","boxShadow": "#fff 0px 0px 6px","margin":"10px 0 10px 0","borderColor":"rgba(255, 255, 255, 1)","color":"rgba(255, 255, 255, 1)","borderRadius":"32px","alignItems":"flex-start","borderWidth":"0","fontSize":"16px","borderStyle":"solid"}'>
        <span>DATA SHOW</span>
    <span>景点介绍展示</span>
</div>
                            </div>
                            <div class="wow " data-wow-duration="2s" data-wow-delay="1s">
<div style="display: flex;justify-content: space-around;flex-wrap: wrap;">
    <div v-for="(item,index) in jingdainList" :key="index" @click="jump('../jingdain/detail.jsp?id='+item.id)" class="list-item4">
        <div class="animation-box" :style='{"padding":"0","boxShadow":"0 0 0px rgba(255,0,0,.8)","margin":"0 20px","borderColor":"rgba(255, 153, 51, 1)","borderRadius":"0","borderWidth":"0","borderStyle":"solid"}'>
            <img :style='{"boxShadow":"0 0 0px rgba(255,255,255,.8)","borderColor":"var(--publicMainColor)","borderRadius":"50% 50% 25% 25%","borderWidth":"8px","width":"100%","borderStyle":"solid","height":"150px"}' :src="item.jingdainPhoto?baseUrl+item.jingdainPhoto.split(',')[0]:''" alt="" />
            <div v-if='true' :style='{"isshow":true,"padding":"10px","margin":"4px 010px","backgroundColor":"var(--publicMainColor)","color":"rgba(255, 255, 255, 1)","borderRadius":"0 0 50% 50%","textAlign":"center","fontSize":"18px"}'>{{item.jingdainName}}</div>
        </div>
    </div>
</div>                                <div style="text-align: center;margin-top: 40px;">
                                    <button @click="jump('../jingdain/list.jsp')" style="display: block;cursor: pointer;" type="button"
                                            :style='{"padding":"0 15px","boxShadow":"0 0 6px rgba(255,0,0,0)","margin":"4px auto","borderColor":"#ccc","backgroundColor":"#fff","color":"rgba(160, 67, 26, 1)","borderRadius":"6px","borderWidth":"0","width":"auto","fontSize":"14px","borderStyle":"solid","height":"34px"}'>
                                        查看更多
                                        <i :style='{"isshow":true,"padding":"0 0 0 1px","fontSize":"14px","color":"rgba(160, 67, 26, 1)"}' class="layui-icon layui-icon-next"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div style="display: flex;justify-content: center;background-repeat: no-repeat;background-position: center center;background-size: cover;">
                    <div class="box" style='width:100%;'>
                        <div style="width: 1200px;height:auto;margin:  0 auto;padding: 10px 0">
                            <div class="wow " data-wow-duration="2s" data-wow-delay="1s">
<div class="title main_backgroundColor"
     :style='{"padding":"10px 0 10px 10px","boxShadow": "#fff 0px 0px 6px","margin":"10px 0 10px 0","borderColor":"rgba(255, 255, 255, 1)","color":"rgba(255, 255, 255, 1)","borderRadius":"32px","alignItems":"flex-start","borderWidth":"0","fontSize":"16px","borderStyle":"solid"}'>
        <span>DATA SHOW</span>
    <span>路线展示</span>
</div>
                            </div>
                            <div class="wow " data-wow-duration="2s" data-wow-delay="1s">
<div style="display: flex;justify-content: space-around;flex-wrap: wrap;">
    <div v-for="(item,index) in luxianList" :key="index" @click="jump('../luxian/detail.jsp?id='+item.id)" class="list-item4">
        <div class="animation-box" :style='{"padding":"0","boxShadow":"0 0 0px rgba(255,0,0,.8)","margin":"0 20px","borderColor":"rgba(255, 153, 51, 1)","borderRadius":"0","borderWidth":"0","borderStyle":"solid"}'>
            <img :style='{"boxShadow":"0 0 0px rgba(255,255,255,.8)","borderColor":"var(--publicMainColor)","borderRadius":"50% 50% 25% 25%","borderWidth":"8px","width":"100%","borderStyle":"solid","height":"150px"}' :src="item.luxianPhoto?baseUrl+item.luxianPhoto.split(',')[0]:''" alt="" />
            <div v-if='true' :style='{"isshow":true,"padding":"10px","margin":"4px 010px","backgroundColor":"var(--publicMainColor)","color":"rgba(255, 255, 255, 1)","borderRadius":"0 0 50% 50%","textAlign":"center","fontSize":"18px"}'>{{item.luxianName}}</div>
        </div>
    </div>
</div>                                <div style="text-align: center;margin-top: 40px;">
                                    <button @click="jump('../luxian/list.jsp')" style="display: block;cursor: pointer;" type="button"
                                            :style='{"padding":"0 15px","boxShadow":"0 0 6px rgba(255,0,0,0)","margin":"4px auto","borderColor":"#ccc","backgroundColor":"#fff","color":"rgba(160, 67, 26, 1)","borderRadius":"6px","borderWidth":"0","width":"auto","fontSize":"14px","borderStyle":"solid","height":"34px"}'>
                                        查看更多
                                        <i :style='{"isshow":true,"padding":"0 0 0 1px","fontSize":"14px","color":"rgba(160, 67, 26, 1)"}' class="layui-icon layui-icon-next"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div style="display: flex;justify-content: center;background-repeat: no-repeat;background-position: center center;background-size: cover;">
                    <div class="box" style='width:100%;'>
                        <div style="width: 1200px;height:auto;margin:  0 auto;padding: 10px 0">
                            <div class="wow " data-wow-duration="2s" data-wow-delay="1s">
<div class="title main_backgroundColor"
     :style='{"padding":"10px 0 10px 10px","boxShadow": "#fff 0px 0px 6px","margin":"10px 0 10px 0","borderColor":"rgba(255, 255, 255, 1)","color":"rgba(255, 255, 255, 1)","borderRadius":"32px","alignItems":"flex-start","borderWidth":"0","fontSize":"16px","borderStyle":"solid"}'>
        <span>DATA SHOW</span>
    <span>商品展示</span>
</div>
                            </div>
                            <div class="wow " data-wow-duration="2s" data-wow-delay="1s">
<div style="display: flex;justify-content: space-around;flex-wrap: wrap;">
    <div v-for="(item,index) in shangpinList" :key="index" @click="jump('../shangpin/detail.jsp?id='+item.id)" class="list-item4">
        <div class="animation-box" :style='{"padding":"0","boxShadow":"0 0 0px rgba(255,0,0,.8)","margin":"0 20px","borderColor":"rgba(255, 153, 51, 1)","borderRadius":"0","borderWidth":"0","borderStyle":"solid"}'>
            <img :style='{"boxShadow":"0 0 0px rgba(255,255,255,.8)","borderColor":"var(--publicMainColor)","borderRadius":"50% 50% 25% 25%","borderWidth":"8px","width":"100%","borderStyle":"solid","height":"150px"}' :src="item.shangpinPhoto?baseUrl+item.shangpinPhoto.split(',')[0]:''" alt="" />
            <div v-if='true' :style='{"isshow":true,"padding":"10px","margin":"4px 010px","backgroundColor":"var(--publicMainColor)","color":"rgba(255, 255, 255, 1)","borderRadius":"0 0 50% 50%","textAlign":"center","fontSize":"18px"}'>{{item.shangpinName}}</div>
        </div>
    </div>
</div>                                <div style="text-align: center;margin-top: 40px;">
                                    <button @click="jump('../shangpin/list.jsp')" style="display: block;cursor: pointer;" type="button"
                                            :style='{"padding":"0 15px","boxShadow":"0 0 6px rgba(255,0,0,0)","margin":"4px auto","borderColor":"#ccc","backgroundColor":"#fff","color":"rgba(160, 67, 26, 1)","borderRadius":"6px","borderWidth":"0","width":"auto","fontSize":"14px","borderStyle":"solid","height":"34px"}'>
                                        查看更多
                                        <i :style='{"isshow":true,"padding":"0 0 0 1px","fontSize":"14px","color":"rgba(160, 67, 26, 1)"}' class="layui-icon layui-icon-next"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div style="display: flex;justify-content: center;background-repeat: no-repeat;background-position: center center;background-size: cover;">
                    <div class="box" style='width:100%;'>
                        <div style="width: 1200px;height:auto;margin:  0 auto;padding: 10px 0">
                            <div class="wow " data-wow-duration="2s" data-wow-delay="1s">
<div class="title main_backgroundColor"
     :style='{"padding":"10px 0 10px 10px","boxShadow": "#fff 0px 0px 6px","margin":"10px 0 10px 0","borderColor":"rgba(255, 255, 255, 1)","color":"rgba(255, 255, 255, 1)","borderRadius":"32px","alignItems":"flex-start","borderWidth":"0","fontSize":"16px","borderStyle":"solid"}'>
        <span>DATA SHOW</span>
    <span>酒店推荐展示</span>
</div>
                            </div>
                            <div class="wow " data-wow-duration="2s" data-wow-delay="1s">
<div style="display: flex;justify-content: space-around;flex-wrap: wrap;">
    <div v-for="(item,index) in jiudianList" :key="index" @click="jump('../jiudian/detail.jsp?id='+item.id)" class="list-item4">
        <div class="animation-box" :style='{"padding":"0","boxShadow":"0 0 0px rgba(255,0,0,.8)","margin":"0 20px","borderColor":"rgba(255, 153, 51, 1)","borderRadius":"0","borderWidth":"0","borderStyle":"solid"}'>
            <img :style='{"boxShadow":"0 0 0px rgba(255,255,255,.8)","borderColor":"var(--publicMainColor)","borderRadius":"50% 50% 25% 25%","borderWidth":"8px","width":"100%","borderStyle":"solid","height":"150px"}' :src="item.jiudianPhoto?baseUrl+item.jiudianPhoto.split(',')[0]:''" alt="" />
            <div v-if='true' :style='{"isshow":true,"padding":"10px","margin":"4px 010px","backgroundColor":"var(--publicMainColor)","color":"rgba(255, 255, 255, 1)","borderRadius":"0 0 50% 50%","textAlign":"center","fontSize":"18px"}'>{{item.jiudianName}}</div>
        </div>
    </div>
</div>                                <div style="text-align: center;margin-top: 40px;">
                                    <button @click="jump('../jiudian/list.jsp')" style="display: block;cursor: pointer;" type="button"
                                            :style='{"padding":"0 15px","boxShadow":"0 0 6px rgba(255,0,0,0)","margin":"4px auto","borderColor":"#ccc","backgroundColor":"#fff","color":"rgba(160, 67, 26, 1)","borderRadius":"6px","borderWidth":"0","width":"auto","fontSize":"14px","borderStyle":"solid","height":"34px"}'>
                                        查看更多
                                        <i :style='{"isshow":true,"padding":"0 0 0 1px","fontSize":"14px","color":"rgba(160, 67, 26, 1)"}' class="layui-icon layui-icon-next"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div style="display: flex;justify-content: center;background-repeat: no-repeat;background-position: center center;background-size: cover;">
                    <div class="box" style='width:100%;'>
                        <div style="width: 1200px;height: auto;margin:  0 auto;padding: 10px 0">
                            <div class="wow " data-wow-duration="2s" data-wow-delay="1s">
<div class="title main_backgroundColor"
     :style='{"padding":"10px 0 10px 10px","boxShadow": "#fff 0px 0px 6px","margin":"10px 0 10px 0","borderColor":"rgba(255, 255, 255, 1)","color":"rgba(255, 255, 255, 1)","borderRadius":"32px","alignItems":"flex-start","borderWidth":"0","fontSize":"16px","borderStyle":"solid"}'>
        <span>DATA SHOW</span>
    <span>公告展示</span>
</div>
                            </div>
                            <div class="wow " data-wow-duration="2s" data-wow-delay="1s">
<div v-if="gonggaoList.length" class="new-list-8" style="display: flex;flex-wrap: wrap;align-items: center;margin-left: 35px">
    <div :style='{"padding":"0","boxShadow":"0 0 0px rgba(0,0,0, .3)","margin":"5px 1%","borderColor":"var(--publicMainColor)","backgroundColor":"rgba(255, 255, 255, 0.3)","borderRadius":"10px","borderWidth":"10px","width":"46%","borderStyle":"solid","height":"140px"}' v-for="(item,index) in gonggaoList" v-if="index<4" :key="index" @click="jump('../gonggao/detail.jsp?id='+item.id)" class="new7-list-item animation-box" style="cursor: pointer;display: flex;width: 50%;align-items: center;">
        <img v-if="index%2==1" :style='{"padding":"0","boxShadow":"0 0 0px rgba(0,0,0,.3)","margin":"0 10px","borderColor":"var(--publicSubColor)","backgroundColor":"#ccc","borderRadius":"100%","borderWidth":"4px","width":"90px","borderStyle":"solid","height":"90px"}' style="object-fit: cover;width: 100%;height: 250px;" :src="baseUrl+item.gonggaoPhoto">
        <div v-if="index%2==1" class="new8-list-body" style="flex: 1;">
            <div :style='{"padding":"5px 10px","boxShadow":"0 0 6px rgba(0,0,0,0)","margin":" 0","borderColor":"#ccc","backgroundColor":"rgba(0,0,0,0)","color":"rgba(0, 0, 0, 1)","borderRadius":"0","borderWidth":"0","width":"100%","lineHeight":"21px","fontSize":"16px","borderStyle":"solid"}' style="box-sizing: border-box;" class="new8-list-item-title line1">{{ item.gonggaoName }}</div>
            <div :style='{"padding":"0 10px","boxShadow":"0 0 6px rgba(0,0,0,0)","margin":"0","borderColor":"#ccc","backgroundColor":"rgba(0,0,0,0)","color":"#ffffff","borderRadius":"0","borderWidth":"0","width":"100%","lineHeight":"21px","fontSize":"14px","borderStyle":"solid"}' style="box-sizing: border-box;" class="new8-list-item-descript line3" v-html="myFilters(item.gonggaoContent)"></div>
            <div :style='{"padding":"0 10px","boxShadow":"0 0 6px rgba(0,0,0,0)","margin":"0","borderColor":"#ccc","backgroundColor":"rgba(0,0,0,0)","color":"#ffffff","borderRadius":"0","borderWidth":"0","width":"100%","lineHeight":"18px","fontSize":"12px","borderStyle":"solid"}' style="box-sizing: border-box;" class="new8-list-item-time">{{ item.insertTime }}</div>
        </div>
        <div v-if="index%2==0" class="new8-list-body" style="flex: 1;">
            <div :style='{"padding":"5px 10px","boxShadow":"0 0 6px rgba(0,0,0,0)","margin":" 0","borderColor":"#ccc","backgroundColor":"rgba(0,0,0,0)","color":"rgba(0, 0, 0, 1)","borderRadius":"0","borderWidth":"0","width":"100%","lineHeight":"21px","fontSize":"16px","borderStyle":"solid"}' style="box-sizing: border-box;" class="new8-list-item-title line1">{{ item.gonggaoName }}</div>
            <div :style='{"padding":"0 10px","boxShadow":"0 0 6px rgba(0,0,0,0)","margin":"0","borderColor":"#ccc","backgroundColor":"rgba(0,0,0,0)","color":"#ffffff","borderRadius":"0","borderWidth":"0","width":"100%","lineHeight":"21px","fontSize":"14px","borderStyle":"solid"}' style="box-sizing: border-box;" class="new8-list-item-descript line3" v-html="myFilters(item.gonggaoContent)"></div>
            <div :style='{"padding":"0 10px","boxShadow":"0 0 6px rgba(0,0,0,0)","margin":"0","borderColor":"#ccc","backgroundColor":"rgba(0,0,0,0)","color":"#ffffff","borderRadius":"0","borderWidth":"0","width":"100%","lineHeight":"18px","fontSize":"12px","borderStyle":"solid"}' style="box-sizing: border-box;" class="new8-list-item-time">{{ item.insertTime }}</div>
        </div>
        <img v-if="index%2==0" :style='{"padding":"0","boxShadow":"0 0 0px rgba(0,0,0,.3)","margin":"0 10px","borderColor":"var(--publicSubColor)","backgroundColor":"#ccc","borderRadius":"100%","borderWidth":"4px","width":"90px","borderStyle":"solid","height":"90px"}' style="object-fit: cover;width: 100%;height: 250px;" :src="baseUrl+item.gonggaoPhoto">
    </div>
</div>                                <div style="margin-top:40px;text-align: center;">
                                    <button @click="jump('../gonggao/list.jsp')" style="display: block;cursor: pointer;" type="button" :style='{"padding":"0 15px","boxShadow":"0 0 6px rgba(255,0,0,0)","margin":"4px auto","borderColor":"#ccc","backgroundColor":"#fff","color":"rgba(160, 67, 26, 1)","borderRadius":"6px","borderWidth":"0","width":"auto","fontSize":"14px","borderStyle":"solid","height":"34px"}'>
                                        查看更多
                                        <i :style='{"isshow":true,"padding":"0 0 0 1px","fontSize":"14px","color":"rgba(160, 67, 26, 1)"}' class="layui-icon layui-icon-next"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div style="display: flex;justify-content: center;background-repeat: no-repeat;background-position: center center;background-size: cover;">
                    <div class="box" style='width:100%;'>
                        <div style="width: 1200px;height:auto;margin:  0 auto;padding: 10px 0">
                            <div class="wow " data-wow-duration="2s" data-wow-delay="1s">
<div class="title main_backgroundColor"
     :style='{"padding":"10px 0 10px 10px","boxShadow": "#fff 0px 0px 6px","margin":"10px 0 10px 0","borderColor":"rgba(255, 255, 255, 1)","color":"rgba(255, 255, 255, 1)","borderRadius":"32px","alignItems":"flex-start","borderWidth":"0","fontSize":"16px","borderStyle":"solid"}'>
        <span>DATA SHOW</span>
    <span>商家展示</span>
</div>
                            </div>
                            <div class="wow " data-wow-duration="2s" data-wow-delay="1s">
<div style="display: flex;justify-content: space-around;flex-wrap: wrap;">
    <div v-for="(item,index) in shangjiaList" :key="index" @click="jump('../shangjia/detail.jsp?id='+item.id)" class="list-item4">
        <div class="animation-box" :style='{"padding":"0","boxShadow":"0 0 0px rgba(255,0,0,.8)","margin":"0 20px","borderColor":"rgba(255, 153, 51, 1)","borderRadius":"0","borderWidth":"0","borderStyle":"solid"}'>
            <img :style='{"boxShadow":"0 0 0px rgba(255,255,255,.8)","borderColor":"var(--publicMainColor)","borderRadius":"50% 50% 25% 25%","borderWidth":"8px","width":"100%","borderStyle":"solid","height":"150px"}' :src="item.shangjiaPhoto?baseUrl+item.shangjiaPhoto.split(',')[0]:''" alt="" />
            <div v-if='true' :style='{"isshow":true,"padding":"10px","margin":"4px 010px","backgroundColor":"var(--publicMainColor)","color":"rgba(255, 255, 255, 1)","borderRadius":"0 0 50% 50%","textAlign":"center","fontSize":"18px"}'>{{item.shangjiaName}}</div>
        </div>
    </div>
</div>                                <div style="text-align: center;margin-top: 40px;">
                                    <button @click="jump('../shangjia/list.jsp')" style="display: block;cursor: pointer;" type="button"
                                            :style='{"padding":"0 15px","boxShadow":"0 0 6px rgba(255,0,0,0)","margin":"4px auto","borderColor":"#ccc","backgroundColor":"#fff","color":"rgba(160, 67, 26, 1)","borderRadius":"6px","borderWidth":"0","width":"auto","fontSize":"14px","borderStyle":"solid","height":"34px"}'>
                                        查看更多
                                        <i :style='{"isshow":true,"padding":"0 0 0 1px","fontSize":"14px","color":"rgba(160, 67, 26, 1)"}' class="layui-icon layui-icon-next"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
    </div>
</div>

<script src="../../xznstatic/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
<script src="../../xznstatic/js/echarts.min.js" type="text/javascript" charset="utf-8"></script>
<script src="../../layui/layui.js"></script>
<script src="../../js/vue.js"></script>
<!-- 引入element组件库 -->
<script src="../../xznstatic/js/element.min.js"></script>
<!-- 引入element样式 -->
<link rel="stylesheet" href="../../xznstatic/css/element.min.css">
<script src="../../xznstatic/js/swiper.min.js"></script>
<script src="../../js/config.js"></script>
<script src="../../modules/config.js"></script>
<script src="../../js/utils.js"></script>
<script src="../../xznstatic/js/wow.min.js"></script>
<script type="text/javascript">
    // 动画效果
    new WOW().init();

    Vue.prototype.myFilters = function (msg) {
        if(msg==null || msg==""){
            return "";
        }else if (msg.length>20){
            msg.replace(/\n/g, "<br>");
            return msg.substring(0,20)+"......";
        }else{
            return msg.replace(/\n/g, "<br>");
        }
    };
    var vue = new Vue({
        el: '#app',
        data: {
            swiperList: [],
            baseUrl:"",
            // dianyingRecommend: [],
            jingdainList: [],
            jingdainTypesList: [],
            luxianList: [],
            luxianTypesList: [],
            shangpinList: [],
            shangpinTypesList: [],
            jiudianList: [],
            jiudianTypesList: [],
            gonggaoList: [],
            gonggaoTypesList: [],
            shangjiaList: [],
            shangjiaTypesList: [],
            //类型查询条件
            jingdainTypes: "",
            luxianTypes: "",
            shangpinTypes: "",
            jiudianTypes: "",
            gonggaoTypes: "",
            shangjiaTypes: "",
        },
        filters: {
            newsDesc: function (val) {
                if (val) {
                    val = val.replace(/<[^<>]+>/g, '').replace(/undefined/g, '');
                    if (val.length > 60) {
                        val = val.substring(0, 60);
                    }

                    return val;
                }
                return '';
            }
        },
        methods: {
            jump(url) {
                jump(url)
            }
            , jumpCheck(url, check1, check2) {
                if (check1 == "2" || check1 == 2) {//级联表的逻辑删除字段[1:未删除 2:已删除]
                    layui.layer.msg("已经被删除", {
                        time: 2000,
                        icon: 2
                    });
                    return false;
                }
                if (check2 == "2" || check2 == 2) {//是否下架[1:上架 2:下架]
                    layui.layer.msg("已经下架", {
                        time: 2000,
                        icon: 2
                    });
                    return false;
                }
                this.jump(url);
            }
        }
    });

    layui.use(['layer', 'form', 'element', 'carousel', 'http', 'jquery'], function () {
        var layer = layui.layer;
        var element = layui.element;
        var form = layui.form;
        var carousel = layui.carousel;
        var http = layui.http;
        var jquery = layui.jquery;
        vue.baseUrl = http.baseurl

        localStorage.setItem("goUtl","./pages/home/home.jsp")

        // 获取轮播图 数据
        http.request('config/list', 'get', {
            page: 1,
            limit: 5
        }, function (res) {
            if (res.data.list.length > 0) {
                let swiperList = [];
                res.data.list.forEach(element => {
                    if (element.value != null
                    ) {
                        swiperList.push({
                            img: element.value
                        });
                    }
                })
                ;

                vue.swiperList = swiperList;

                vue.$nextTick(() => {
                    carousel.render({
                        elem: '#test1',
                        width: '100%',
                        height: '100%',
                        arrow: 'hover',
                        anim: 'default',
                        autoplay: 'true',
                        interval: '3000',
                        indicator: 'inside'
                    });

                })

                // vue.$nextTick(()=>{
                //   window.xznSlide();
                // });
            }
        });

        jingdainSelect();
        //类型动态搜索
        $(document).on("click", ".jingdainTypes-search", function(e) {
            vue.jingdainTypes = $(this).attr('index');
            jingdainSelect();
        });
        jingdainTypesSelect();//类型查询
        luxianSelect();
        //类型动态搜索
        $(document).on("click", ".luxianTypes-search", function(e) {
            vue.luxianTypes = $(this).attr('index');
            luxianSelect();
        });
        luxianTypesSelect();//类型查询
        shangpinSelect();
        //类型动态搜索
        $(document).on("click", ".shangpinTypes-search", function(e) {
            vue.shangpinTypes = $(this).attr('index');
            shangpinSelect();
        });
        shangpinTypesSelect();//类型查询
        jiudianSelect();
        //类型动态搜索
        $(document).on("click", ".jiudianTypes-search", function(e) {
            vue.jiudianTypes = $(this).attr('index');
            jiudianSelect();
        });
        jiudianTypesSelect();//类型查询
        gonggaoSelect();
        //类型动态搜索
        $(document).on("click", ".gonggaoTypes-search", function(e) {
            vue.gonggaoTypes = $(this).attr('index');
            gonggaoSelect();
        });
        gonggaoTypesSelect();//类型查询
        shangjiaSelect();
        //类型动态搜索
        $(document).on("click", ".shangjiaTypes-search", function(e) {
            vue.shangjiaTypes = $(this).attr('index');
            shangjiaSelect();
        });
        shangjiaTypesSelect();//类型查询

        function jingdainTypesSelect() {//类型查询
            http.request("dictionary/page?page=1&limit=100&sort=&order=&dicCode=jingdain_types",'get',{},function(res) {
                if (res.code == 0) {vue.jingdainTypesList = res.data.list;}
            });
        }
        function jingdainSelect(){//数据查询
            http.request('jingdain/gexingtuijian', 'get', {
                page: 1,
                limit: 8,
                sort: "jingdain_clicknum",//字段
                jingdainDelete: 1,
                jingdainTypes: vue.jingdainTypes,//类型
                order: "desc",//asc desc
            },function (res) {
                vue.jingdainList = res.data.list;
            })
        };
        function luxianTypesSelect() {//类型查询
            http.request("dictionary/page?page=1&limit=100&sort=&order=&dicCode=luxian_types",'get',{},function(res) {
                if (res.code == 0) {vue.luxianTypesList = res.data.list;}
            });
        }
        function luxianSelect(){//数据查询
            http.request('luxian/gexingtuijian', 'get', {
                page: 1,
                limit: 8,
                sort: "luxian_clicknum",//字段
                luxianDelete: 1,
                luxianTypes: vue.luxianTypes,//类型
                order: "desc",//asc desc
            },function (res) {
                vue.luxianList = res.data.list;
            })
        };
        function shangpinTypesSelect() {//类型查询
            http.request("dictionary/page?page=1&limit=100&sort=&order=&dicCode=shangpin_types",'get',{},function(res) {
                if (res.code == 0) {vue.shangpinTypesList = res.data.list;}
            });
        }
        function shangpinSelect(){//数据查询
            http.request('shangpin/gexingtuijian', 'get', {
                page: 1,
                limit: 8,
                sort: "shangpin_clicknum",//字段
                shangpinDelete: 1,
                shangpinTypes: vue.shangpinTypes,//类型
                order: "desc",//asc desc
            },function (res) {
                vue.shangpinList = res.data.list;
            })
        };
        function jiudianTypesSelect() {//类型查询
            http.request("dictionary/page?page=1&limit=100&sort=&order=&dicCode=jiudian_types",'get',{},function(res) {
                if (res.code == 0) {vue.jiudianTypesList = res.data.list;}
            });
        }
        function jiudianSelect(){//数据查询
            http.request('jiudian/gexingtuijian', 'get', {
                page: 1,
                limit: 8,
                sort: "jiudian_clicknum",//字段
                jiudianDelete: 1,
                jiudianTypes: vue.jiudianTypes,//类型
                order: "desc",//asc desc
            },function (res) {
                vue.jiudianList = res.data.list;
            })
        };
        function gonggaoTypesSelect() {//类型查询
            http.request("dictionary/page?page=1&limit=100&sort=&order=&dicCode=gonggao_types",'get',{},function(res) {
                if (res.code == 0) {vue.gonggaoTypesList = res.data.list;}
            });
        }
        function gonggaoSelect(){//数据查询
            http.request('gonggao/list', 'get', {
                page: 1,
                limit: 8,
                gonggaoTypes: vue.gonggaoTypes,//类型
                order: "desc",//asc desc
            },function (res) {
                vue.gonggaoList = res.data.list;
            })
        };
        function shangjiaTypesSelect() {//类型查询
            http.request("dictionary/page?page=1&limit=100&sort=&order=&dicCode=shangjia_types",'get',{},function(res) {
                if (res.code == 0) {vue.shangjiaTypesList = res.data.list;}
            });
        }
        function shangjiaSelect(){//数据查询
            http.request('shangjia/list', 'get', {
                page: 1,
                limit: 8,
                shangjiaDelete: 1,
                shangjiaTypes: vue.shangjiaTypes,//类型
                order: "desc",//asc desc
            },function (res) {
                vue.shangjiaList = res.data.list;
            })
        };

    });

    window.xznSlide = function () {
        // jQuery(".banner").slide({mainCell:".bd ul",autoPlay:true,interTime:5000});
        jQuery("#ifocus").slide({
            titCell: "#ifocus_btn li",
            mainCell: "#ifocus_piclist ul",
            effect: "leftLoop",
            delayTime: 200,
            autoPlay: true,
            triggerTime: 0
        });
        jQuery("#ifocus").slide({titCell: "#ifocus_btn li", mainCell: "#ifocus_tx ul", delayTime: 0, autoPlay: true});
        jQuery(".product_list").slide({
            mainCell: ".bd ul",
            autoPage: true,
            effect: "leftLoop",
            autoPlay: true,
            vis: 5,
            trigger: "click",
            interTime: 4000
        });
    };
</script>
<script src="../../xznstatic/js/index.js"></script>
</body>
</html>
