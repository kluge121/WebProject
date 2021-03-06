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
<link rel="stylesheet" href="assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
<title>SSAFY</title>
  <script src="https://unpkg.com/vue"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/vue"></script>

</head>
<body>

<jsp:include page="../common/nav.jsp" />
<div id='app'>
<div class='headtitle'><h2 v-html='currenttitle'></h2></div>
<div class='search_box'>
<a href='#' @click='showlist(1)'>게시판 추가</a> | 
<a href='#' @click='showlist(0)'>모든게시물 보기</a>
</div>

<component v-bind:is = "currentview"></component>  
</div>

<script type="text/x-template" id="listhrmtemplate">
<div>
<div>
<table class='list_table'>
<col width="10%"><col width="20%">
<col width="20%"><col width="20%"><col width="10%"><col width="10%">
<tr>
  <th>번호</th>
  <th>사용자</th>
  <th>제목</th>
  <th>날짜</th>
  <th>조회수</th>
   <th>비고</th>
</tr>
<tr v-for="board in boards" class = "nicecolor">
  <td v-html="board.number"></td>
  <td v-html="board.user_id"></td>
  <td v-html="board.title" @click="show_detail(board.number)"></td>
  <td v-html="board.date"></td>
  <td v-html="board.click"></td>
   <td class='button' @click="deleteboard(board.number)"><input type="button" class='blue' value='삭제'></button></td>
</tr>
</table>
</div>
<div>
</script>
<script type="text/x-template" id="addtemplate">
<div>
   <div>
      <form action="" method="post" id="_frmForm" name="frmForm" @submit.prevent="addBoard">
         <table class="content_table">
            <colgroup>
                  <col style="width:30%;" />
                  <col style="width:70%;" />                     
            </colgroup>   
            <tr>
               <th>작성자</th>
               <td><input data-msg="작성자" type="text" name="user_id" id="_name" size="30" v-model="cname"/></td>
            </tr>
            <tr>
               <th>제목</th>
               <td><input data-msg="제목" type="text" name="title"  id="_title" size="20" v-model="ctitle" /></td>
            </tr>
            <tr>
               <th>내용</th>
               <td><input data-msg="내용" type="text" name="content"  id="_content" size="30" v-model="ccontent" /></td>
            </tr>
            <tr>
               <th>작성일</th>
               <td><input data-msg="작성일" type="date" name="start_date" id="_start_date" size="30" v-model="cstart_date"/></td>
            </tr>
            <tr>
               <td colspan="2" style="height:50px; text-align:center;">
               <button type="submit" name="button">게시판추가</button></td>
            </tr>         
         </table>
      </form>
   </div>
</div>
</script>
<script type="text/x-template" id="addanswertemplate">
<div>
   <div>
      <form action="" method="post" id="_frmForm" name="frmForm" @submit.prevent="addAnswer">
         <table class="content_table">
            <colgroup>
                  <col style="width:30%;" />
                  <col style="width:70%;" />                     
            </colgroup>   
            <tr>
               <th>제목</th>
               <td><input data-msg="제목" type="text" name="title"  id="_title" size="20" v-model="ctitle" /></td>
            </tr>
            <tr>
               <th>내용</th>
               <td><input data-msg="내용" type="text" name="content"  id="_content" size="30" v-model="ccontent" /></td>
            </tr>
            <tr>
               <td colspan="2" style="height:50px; text-align:center;">
               <button type="submit" name="button">답변추가</button></td>
            </tr>         
         </table>
      </form>
   </div>
</div>
</script>
<script type="text/x-template" id="detailtemplate">
<div>
   <table class='content_table'>
      <col width="10%"><col width="20%">
      <col width="20%"><col width="20%"><col width="10%">
      <tr>
         <th>번호</th>
         <td v-html="board.number"></td>
      </tr>
      <tr>
         <th>작성자</th>
         <td v-html="board.user_id"></td>
      </tr>
      <tr>
         <th>제목</th>
         <td v-html="board.title"></td>
      </tr>
      <tr>
         <th>내용</th>
         <td v-html="board.content"></td>
      </tr>
      <tr>
         <th>작성일</th>
         <td v-html="board.date"></td>
      </tr>
      <tr>
         <td class='button' @click="updateboard(board.number)"><input type="button" class='blue' value='수정'></button></td>
         <td class='button' @click="deleteboard(board.number)"><input type="button" class='blue' value='삭제'></button></td>
         <td class='button' @click="showlist(0)"><input type="button" class='blue' value='돌아가기'></button></td>
      </tr>
      <tr v-if="check === 'noshow'">
         <td class='button' @click="addanswer(board.number)"><input type="button" class='blue' value='답글추가'></button></td>
      </tr>
   </table>
   <div v-if="check === 'show'">
   <table class='content_table'>
      <tr>
         <th>제목</th>
         <td v-html="answer.title"></td>
      </tr>
      <tr>
         <th>내용</th>
         <td v-html="answer.content"></td>
      </tr>
      <tr>
         <th>작성일</th>
         <td v-html="answer.date"></td>
      </tr>
      <tr>
         <td class='button' @click="updateanswer(answer.number)"><input type="button" class='blue' value='수정'></button></td>
      </tr>
      </table>

   </div>
</div>
</script>
<script type="text/x-template" id="updateanswertemplate">
<div>
   <div>
      <form action="" method="post" id="_frmForm" name="frmForm" @submit.prevent="updateAnswer">
         <table class="content_table">
            <colgroup>
                  <col style="width:30%;" />
                  <col style="width:70%;" />                     
            </colgroup>   
            <tr>
               <th>제목</th>
               <td><input id="_title" v-model="ctitle" type="text" size="20"/></td>
            </tr>
            <tr>
               <th>내용</th>
               <td><input id="_content" v-model="ccontent" type="text" size="30"/></td>
            </tr>
            <tr>
               <td colspan="2" style="height:50px; text-align:center;">
               <button type="submit" name="button">답변 수정</button></td>
            </tr>         
         </table>
      </form>
   </div>
</div>
</script>
<script type="text/x-template" id="updatetemplate">
<div>
   <div>
      <form action="" method="post" id="_frmForm" name="frmForm" @submit.prevent="updateBoard">
         <table class="content_table">
            <colgroup>
                  <col style="width:30%;" />
                  <col style="width:70%;" />                     
            </colgroup>   
            <tr>
               <th>작성자</th>
               <td v-html="board.user_id" v-model="cname"></td>
            </tr>
            <tr>
               <th>제목</th>
               <td><input id="_title" type="text" size="20" v-model="ctitle"/></td>
            </tr>
            <tr>
               <th>내용</th>
               <td><input id="_content" type="text" size="30" v-model="ccontent"/></td>
            </tr>
            <tr>
               <th>작성일</th>
               <td v-html="board.date"></td>
            </tr>
            <tr>
               <td colspan="2" style="height:50px; text-align:center;">
               <button type="submit" name="button">게시판 수정</button></td>
            </tr>         
         </table>
      </form>
   </div>
</div>
</script>

<script type="text/javascript">
var addanswer = Vue.component('addanswer',{
   template: '#addanswertemplate',
   data(){
      return{
         boards: null,
         loading: true,
         errored: false,
         ctitle:'',
         ccontent:'',
         cstart_date:''
      }
   },
   methods:{
      addAnswer(){
         if(this.ctitle==''){alert('제목을 입력하세요.');return;}
         if(this.ccontent==''){alert('내용을 입력하세요.');return;}
         this.cstart_date=new Date();
            
         axios.post('http://localhost:8197/ssafyvue/api/addBoardAnswer/'+App.number,{
            title: this.ctitle,
            content: this.ccontent,
            date: this.cstart_date
         }).then(function(response){
            if(response.data.state=='succ'){
               alert(response.data.name+"이 실행되었습니다.");
               location.href='./qna.do';
            }else{
               alert(response.data.name+"에 실패하였습니다.");
               location.href='./qna.jsp';
            }
         });
      }}
   });
var detailboard = Vue.component('detailboard',{
   template: '#detailtemplate',
   data(){
      return{
         info: null,
         loading: true,
         errored: false,
         board:{},
         answer: {},
         check: "show"
      }
   },
   mounted(){
      axios
      .get('http://localhost:8197/ssafyvue/api/findBoardByNum/'+App.number)
      .then(response => (this.board = response.data))
      .catch(error =>{
         console.log(error)
         this.errored = true
      })
      .finally(() => this.loading = false);
      
      axios
      .get('http://localhost:8197/ssafyvue/api/findAnswerBoardByNum/'+App.number)
      .then(response => {
         this.answer = response.data
         console.log(this.answer);
         if(this.answer.title==null){
            this.check="noshow";
         }
      })
      .catch(error=>{
         console.log(error)
         this.errored = true
      })
      .finally(() => this.loading = false);
      

   },
   methods:{
      showlist:function(num){
         App.currentview='boardlist';
         App.showlist(0);
      },
      updateboard:function(num){
         App.number = num;
         App.currentview = 'updateboard';
         App.showlist(3);
      },
      deleteboard:function(num){
         App.number = num;
         axios
         .post('http://localhost:8197/ssafyvue/api/deleteBoard/'+App.number)
         .then(function(response){
            if(response.data.state=='succ'){
                 alert(response.data.name+"이 실행되었습니다.");
                 location.href='./qna.jsp';
              }else{
                 alert(response.data.name+"이 실패하였습니다.");
                 location.href='./qna.jsp';
              }
         })
         App.currentview = 'boardlist';
         App.showlist(0);
      },
      addanswer:function(num){
         App.number = num;
         App.currentview = 'addanswer';
         App.showlist(4);
      },
      updateanswer:function(num){
         App.number = num;
         App.currentview = 'updateanswer';
         App.showlist(5);
      }
   }
});
var boardlist = Vue.component('boardlist',{
    template: '#listhrmtemplate',
    data(){
        return {
          upHere : false,
          boards: [],
          loading: true,
          errored: false 
        }
      },
      methods:{
       show_detail:function(number){
          alert(number+"상세보기");
          App.number = number;
          axios
          .get('http://localhost:8197/ssafyvue/api/updateBoardViewCnt/'+App.number)
          .then(function(response){
               if(response.data.state=='succ'){
               }else{
                  alert(response.data.name+"이 실패하였습니다.");
                  location.href='./qna.jsp';
               }
            })
            App.currentview = 'detailboard';
          App.showlist(2);
       },
          deleteboard:function(number){
            alert(number);
            App.number = number;
            axios
               .post('http://localhost:8197/ssafyvue/api/deleteBoard/'+App.number)
               .then(function(response){
                  if(response.data.state=='succ'){
                     alert(response.data.name+"이 실행되었습니다.");
                     location.href='./qna.jsp';
                  }else{
                     alert(response.data.name+"이 실패하였습니다.");
                     location.href='./qna.jsp';
                  }
               })
               .catch(error =>{
                  console.log(error)
                  this.errored = true
               })
               .finally(() => this.loading = false);
         } 
      },
      mounted () {
        axios
          .get('http://localhost:8197/ssafyvue/api/findAllBoard')
          //.get('./emp.json')
          .then(response => (this.boards = response.data))
          .catch(error => {
            console.log(error)
            this.errored = true
          })
          .finally(() => this.loading = false);
      }
});
var addboard = Vue.component('addboard',{
   template: '#addtemplate',
   data(){
      return{
         boards: null,
         loading: true,
         errored: false,
         cname:'',
         ctitle:'',
         ccontent:'',
         cstart_date:''
      }
   },
   methods:{
      addBoard(){
         if(this.cname==''){alert('아이디를 입력하세요.'); return;}
         if(this.ctitle==''){alert('제목을 입력하세요.');return;}
         if(this.ccontent==''){alert('내용을 입력하세요.');return;}
         this.cstart_date=new Date();
            
         axios.post('http://localhost:8197/ssafyvue/api/addBoard',{
            user_id: this.cname,
            title: this.ctitle,
            content: this.ccontent,
            date: this.cstart_date
         }).then(function(response){
            if(response.data.state=='succ'){
               alert(response.data.name+"이 실행되었습니다.");
               location.href='./qna.jsp';
            }else{
               alert(response.data.name+"에 실패하였습니다.");
               location.href='./qna.jsp';
            }
         });
      }}
   });
var updateanswer = Vue.component('updateanswer',{
   template: '#updateanswertemplate',
   data(){
      return{
         loading: true,
         errored: false,
         answer:{},
         ctitle:'',
         ccontent:'',
         cstart_date:''
      }
   },
   mounted(){
      axios
      .get('http://localhost:8197/ssafyvue/api/findAnswerBoardByNum/'+App.number)
      .then(response => {
         this.answer = response.data
         this.ctitle = this.answer.title
         this.ccontent = this.answer.content
      })
      .catch(error =>{
         console.log(error)
         this.errored = true
      })
      .finally(() => this.loading = false);
   },
   methods:{
      updateAnswer:function(num){
         if(this.ctitle==''){alert('제목을 입력하세요.');return;}
         if(this.ccontent==''){alert('내용을 입력하세요.');return;}
         this.cstart_date=new Date();
         axios.post('http://localhost:8197/ssafyvue/api/updateBoardAnswer/'+App.number,{
            title: this.ctitle,
            content: this.ccontent,
            date: this.cstart_date
         }).then(function(response){
            if(response.data.state=='succ'){
               alert(response.data.name+"이 실행되었습니다.");
            }else{
               alert(response.data.name+"에 실패하였습니다.");
               location.href='./qna.jsp';
            }
            App.currentview = 'detailboard';
             App.showlist(2);
         });   
      }}
   });   
var updateboard = Vue.component('updateboard',{
   template: '#updatetemplate',
   data(){
      return{
         board: {},
         loading: true,
         errored: false,
         cnum: 0,
         cname:'',
         ctitle:'',
         ccontent:'',
         cstart_date:''
      }
   },
   mounted(){
       axios
         .get('http://localhost:8197/ssafyvue/api/findBoardByNum/'+App.number)
         .then(response => {this.board = response.data
               this.cnum = this.board.number
               this.ctitle = this.board.title
               this.ccontent = this.board.content
             })
         .catch(error => {
           console.log(error)
           this.errored = true
         })
         .finally(() => this.loading = false);
   },
   methods:{
      updateBoard:function(num){
         if(this.ctitle==''){alert('제목을 입력하세요.');return;}
         if(this.ccontent==''){alert('내용을 입력하세요.');return;}
         this.cstart_date=new Date();
         axios.post('http://localhost:8197/ssafyvue/api/updateBoard/'+App.number,{
            user_id: this.cname,
            title: this.ctitle,
            content: this.ccontent,
            date: this.cstart_date
         }).then(function(response){
            if(response.data.state=='succ'){
               alert(response.data.name+"이 실행되었습니다.");
            }else{
               alert(response.data.name+"에 실패하였습니다.");
               location.href='./qna.jsp';
            }
            App.currentview = 'detailboard';
             App.showlist(2);
         });
         
      }}
   });
   
   
var App=new Vue({
  el: '#app',
  data: {
     currenttitle:'SSAFY BOARD LIST',
     empid:'',
     currentview: 'boardlist',
      allviews:['boardlist','addboard','detailboard','updateboard','addanswer','updateanswer'],
      cutt:['SSAFY BOARD LIST','ADD BOARD','DETAILBOARD','UPDATE BOARD','ADD ANSWER','UPDATE ANSWER']
   },
   components: {
       boardlist: boardlist,
       addboard: addboard,
       detailboard: detailboard,
       addanswer: addanswer,
       updateanswer: updateanswer
     },
     methods:{
        showlist: function (val) {
           //alert(val);
          this.currentview=this.allviews[val];
           this.currenttitle=this.cutt[val];
           //listhrm
         }
     }
});
Vue.config.devtools = true;
 </script>
 
 <jsp:include page="../common/footer.jsp" />
</body>
</html>