<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8" />


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<title>Notice</title>
<script src="https://unpkg.com/vue"></script>
<link rel="stylesheet" type="text/css" href="./css/table.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
</head>
<body>
<div id='app'>
<component v-bind:is = "currentview"></component>
<a href='#' @click='showlist(1)'>공지사항 추가</a>
</div>
<script type="text/x-template" id="listtemplate">
<div>
   <div class="accordion">
      <table v-for="(item,index) in notices" class='list_table'>
         <tr>
            <td @click="activateBody(index)" class="collapsible-item-header"><strong>{{item.title}}</strong></td>
            <td class='button' @click="updatenotice(item.num)"><input type="button" class='blue' value='수정'></td>
            <td class='button' @click="deletenotice(item.num)"><input type="button" class='blue' value='삭제'></td>
         </tr>
         <tr>
            <td v-html="item.content" v-if="item.activate" class="collapsible-item-body"></td>
         </tr>
      </table>
   </div>
</div>
</script>
<script type="text/x-template" id="addtemplate">
   <div>
      <div>
         <form action="" method="post" id="_frmForm" name="frmForm" @submit.prevent="addNotice">
            <table class='content_table'>
               <tr>
                  <th>제목</th>
                  <td><input data-msg="제목" type="text" name="title" id="_title" size="40" v-model="ctitle"/></td>
               </tr>
               <tr>
                  <th>내용</th>
                  <td><input data-msg="내용" type="text" name="content" id="_content" size="40" style="height:40px;">
               </tr>
               <tr>
                  <td colspan="2" style="height:50px; text-align:center;">
                  <button type="submit" name="button">공지사항추가</button></td>
               </tr>
         </form>
      <div>
   </div>
</script>
<script type="text/x-template" id="updatetemplate">
   <div>
      <div>
         <form action="" method="post" id="_frmForm" name="frmForm" @submit.prevent="updateNotice">
            <table>
               <tr>
                  <th>제목</th>
                  <td><input data-msg="제목" type="text" name="title" id="_title" size="40" v-model="ctitle"/></td>
               </tr>
               <tr>
                  <th>내용</th>
                  <td><input data-msg="내용" type="text" name="content" id="_content" size="40" style="height:40px;" v-model="ccontent"/></td>
               </tr>
               <tr>
                  <td style="height:50px; text-align:center;">
                  <button type="submit" name="button">공지사항수정</button></td>
                  <td class='button' @click="showlist(0)"><input type="button" class='blue' value='취소'></td>
               </tr>
         </form>
      <div>
   </div>
</script>
<script type="text/javascript">
var updatenotice = Vue.component('updatenotice',{
   template: '#updatetemplate',
   data(){
      return{
         loading: true,
         errored: false,
         ctitle:'',
         ccontent:'',
         cstart_date:'',
         notice: {}
      }
   },
   mounted(){
      axios
      .get('http://localhost:8197/ssafyvue/api/detailNotice/'+App.num)
      .then(response => {
         this.notice = response.data
         this.ctitle = this.notice.title
         this.ccontent = this.notice.content
      })
      .catch(error=>{
         console.log(error)
         this.errored = true
      })
      .finally(() => this.loading = false);
   },
   methods:{
      updateNotice(){
         if(this.ctitle==''){alert('제목을 입력하세요.');return;}
         if(this.ccontent==''){alert('내용을 입력하세요.');return;}
         this.cstart_date=new Date();
         
         axios.post('http://localhost:8197/ssafyvue/api/updateNotice/'+App.num,{
            title: this.ctitle,
            content: this.ccontent,
            date: this.cstart_date
         }).then(function(response){
            if(response.data.state=='succ'){
               alert(response.data.name+"이 실행되었습니다.");
            }else{
               alert(response.data.name+"에 실패하였습니다.");
               location.href='./notice.html';
            }
            App.currentview = 'listnotice';
            App.showlist(0);
         });
      },
      showlist(num){
         App.currentview = 'listnotice';
         App.showlist(num);
      }
   }
});
var addnotice = Vue.component('addnotice',{
   template: '#addtemplate',
   data(){
      return{
         loading: true,
         errored: false,
         ctitle:'',
         ccontent:'',
         cstart_date:''
      }
   },
   methods:{
      addNotice(){
         if(this.ctitle==''){alert('제목을 입력하세요.');return;}
         if(this.ccontent==''){alert('내용을 입력하세요.');return;}
         this.cstart_date=new Date();
         
         axios.post('http://localhost:8197/ssafyvue/api/addNotice',{
            title: this.ctitle,
            content: this.ccontent,
            date: this.cstart_date
         }).then(function(response){
            if(response.data.state=='succ'){
               alert(response.data.name+"이 실행되었습니다.");
               location.href='./notice.html';
            }else{
               alert(response.data.name+"에 실패하였습니다.");
               location.href='./notice.html';
            }
         });
      }
   }
});
var listnotice = Vue.component('listnotice',{
   template: '#listtemplate',
   data(){
      return{
         notices: [],
         loading: true,
         errored: false
      }
   },
   mounted(){
      axios
      .get('http://localhost:8197/ssafyvue/api/showAllNotice')
      .then(response => (this.notices = response.data))
      .catch(error =>{
         console.log(error)
         this.errored = true
      })
      .finally(() => this.loading = false);
   },
   methods:{
      activateBody(index){
         this.notices[index].activate=!this.notices[index].activate;
      },
      deletenotice: function(num){
         App.num = num;
         axios
         .get('http://localhost:8197/ssafyvue/api/deleteNotice/'+App.num)
         .then(function(response){
            if(response.data.state=='succ'){
                 alert(response.data.name+"이 실행되었습니다.");
                 location.href='./notice.html';
              }else{
                 alert(response.data.name+"이 실패하였습니다.");
                 location.href='./notice.html';
              }
         })
      },
      updatenotice(num){
         App.num = num;
         App.currentview = 'updatenotice';
         App.showlist(2);
      }
   }
});
var App=new Vue({
   el: '#app',
   data:{
      currentview: 'listnotice',
      allviews:['listnotice','addnotice','updatenotice']
   },
   components:{
      listnotice: listnotice,
      addnotice: addnotice,
      updatenotice: updatenotice
   },methods:{
      showlist: function(val){
         this.currentview=this.allviews[val];
      }
   }
});
</script>
</body>
</html>