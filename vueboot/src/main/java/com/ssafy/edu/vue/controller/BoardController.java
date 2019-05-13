package com.ssafy.edu.vue.controller;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.edu.vue.dto.BoardAnswerDto;
import com.ssafy.edu.vue.dto.BoardDto;
import com.ssafy.edu.vue.help.BoolResult;
import com.ssafy.edu.vue.help.NumberResult;
import com.ssafy.edu.vue.service.BoardService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

//http://localhost:8197/humans/swagger-ui.html
@CrossOrigin(origins = {"*"}, maxAge = 6000)
@RestController
@RequestMapping("/api")
@Api(value="SSAFY", description="SafeFood Q&A")
public class BoardController {
   public static final Logger logger = LoggerFactory.getLogger(BoardController.class);
   
   @Autowired
   private BoardService boardservice;
   
   @ApiOperation(value = "모든 게시판 정보를 반환한다.", response = List.class)
   @RequestMapping(value = "/findAllBoard", method = RequestMethod.GET)
   public ResponseEntity<List<BoardDto>> findAllBoard() throws Exception{
      logger.info("1.findAllBoard"+new Date());
      List<BoardDto> boards = boardservice.findAllBoard();
      if(boards.isEmpty())
         return new ResponseEntity(HttpStatus.NO_CONTENT);
      return new ResponseEntity<List<BoardDto>>(boards,HttpStatus.OK);
   }
   
   @ApiOperation(value = "게시판 추가한다.그리고 그 게시판의 번호를 반환한다.", response = NumberResult.class)
   @RequestMapping(value = "/addBoard",method = RequestMethod.POST)
   public ResponseEntity<NumberResult> addBoard(@RequestBody BoardDto dto) throws Exception{
      logger.info("2.addBoard"+new Date());
      logger.info("2.addBoard"+dto);
      int total = boardservice.addBoard(dto);
      NumberResult nr = new NumberResult();
      nr.setCount(total);
      nr.setName("addBoard");
      nr.setState("succ");
      logger.info("2.addBoard"+total);
      if(total<=0) {
         nr.setCount(-1);
         nr.setName("addBoard");
         nr.setState("fail");
         return new ResponseEntity<NumberResult>(nr, HttpStatus.OK);
      }
      return new ResponseEntity<NumberResult>(nr, HttpStatus.OK);
   }
   @ApiOperation(value = "해당 게시판 자세히 반환한다.",response = BoardDto.class)
   @RequestMapping(value = "/findBoardByNum/{number}",method = RequestMethod.GET)
   public ResponseEntity<BoardDto> findBoardByNum(@PathVariable int number) throws Exception{
      logger.info("3.findBoardByNum"+new Date());
      BoardDto boarddto = boardservice.findBoardByNum(number);
      if(boarddto == null|| boarddto.getNumber() == 0) {
         return new ResponseEntity(HttpStatus.NO_CONTENT);
      }
      return new ResponseEntity<BoardDto>(boarddto,HttpStatus.OK);
   }
   @ApiOperation(value = "해당 게시판의 답변을 반환한다.",response = BoardAnswerDto.class)
   @RequestMapping(value = "/findAnswerBoardByNum/{number}",method = RequestMethod.GET)
   public ResponseEntity<BoardAnswerDto> findAnswerBoardByNum(@PathVariable int number) throws Exception{
      logger.info("4.findAnswerBoardByNum"+new Date());
      BoardAnswerDto dto = boardservice.findAnswerByNum(number);
      
      
      if(dto == null|| dto.getNumber() == 0) {
         return new ResponseEntity<BoardAnswerDto>(new BoardAnswerDto(),HttpStatus.NO_CONTENT);
      }
      return new ResponseEntity<BoardAnswerDto>(dto,HttpStatus.OK);
   }
   @ApiOperation(value = "게시판 답변을 추가한다.그리고 그 게시판답변의 번호를 반환한다.", response = NumberResult.class)
   @RequestMapping(value = "/addBoardAnswer/{number}",method = RequestMethod.POST)
   public ResponseEntity<NumberResult> addBoardAnswer(@RequestBody BoardAnswerDto dto,@PathVariable int number) throws Exception{
      logger.info("5.addAnswerBoard"+new Date());
      logger.info("5.addAnswerBoard"+dto);
      dto.setNumber(number);
      boardservice.addAnswerBoard(dto);
      NumberResult nr = new NumberResult();
      nr.setCount(dto.getNumber());
      nr.setName("addAnswerBoard");
      nr.setState("succ");
      logger.info("2.addAnswerBoard"+dto.getNumber());
      if(dto.getNumber()<=0) {
         nr.setCount(-1);
         nr.setName("addAnswerBoard");
         nr.setState("fail");
         return new ResponseEntity<NumberResult>(nr, HttpStatus.OK);
      }
      return new ResponseEntity<NumberResult>(nr, HttpStatus.OK);
   }
   @ApiOperation(value = "게시판을 수정한다.",response = BoolResult.class)
   @RequestMapping(value = "/updateBoard/{number}",method = RequestMethod.POST)
   public ResponseEntity<BoolResult> updateBoard(@RequestBody BoardDto dto,@PathVariable int number) throws Exception{
      logger.info("6.updateBoard"+new Date());
      BoolResult result = new BoolResult();
      dto.setNumber(number);
      boolean t = boardservice.updateBoard(dto);
      result.setCount(t);
      result.setName("updateBoard");
      result.setState("succ");
      if(!t) {
         return new ResponseEntity(HttpStatus.NO_CONTENT);
      }
      return new ResponseEntity<BoolResult>(result,HttpStatus.OK);
   }
   @ApiOperation(value = "게시판 답변을 수정한다.",response = BoolResult.class)
   @RequestMapping(value = "/updateBoardAnswer/{number}",method = RequestMethod.POST)
   public ResponseEntity<BoolResult> updateBoardAnswer(@RequestBody BoardAnswerDto dto,@PathVariable int number) throws Exception{
      logger.info("7.updateAnswerBoard"+new Date());
      BoolResult result = new BoolResult();
      dto.setNumber(number);
      boolean t = boardservice.updateAnswerBoard(dto);
      result.setCount(t);
      result.setName("updateAnswerBoard");
      result.setState("succ");
      if(!t) {
         return new ResponseEntity(HttpStatus.NO_CONTENT);
      }
      return new ResponseEntity<BoolResult>(result,HttpStatus.OK);
   }
   @ApiOperation(value = "게시판을 삭제한다.",response = BoolResult.class)
   @RequestMapping(value = "/deleteBoard/{number}",method = RequestMethod.POST)
   public ResponseEntity<BoolResult> deleteBoard(@PathVariable int number) throws Exception{
      logger.info("8.deleteBoard"+new Date());
      BoolResult result = new BoolResult();
      boolean t = boardservice.deleteBoard(number);
      result.setCount(t);
      result.setName("deleteBoard");
      result.setState("succ");
      if(!t) {
         return new ResponseEntity(HttpStatus.NO_CONTENT);
      }
      return new ResponseEntity<BoolResult>(result,HttpStatus.OK);
   }
   @ApiOperation(value = "조회수를 올린다.", response = BoolResult.class)
   @RequestMapping(value = "/updateBoardViewCnt/{number}",method = RequestMethod.GET)
   public ResponseEntity<BoolResult> updateBoardViewCnt(@PathVariable int number) throws Exception{
      logger.info("9.updateBoardViewCnt"+new Date());
      BoolResult result = new BoolResult();
      boolean t = boardservice.updateViewCnt(number);
      result.setCount(t);
      result.setName("updateBoardViewCnt");
      result.setState("succ");
      if(!t) {
         return new ResponseEntity(HttpStatus.NO_CONTENT);
      }
      return new ResponseEntity<BoolResult>(result,HttpStatus.OK);
   }
}