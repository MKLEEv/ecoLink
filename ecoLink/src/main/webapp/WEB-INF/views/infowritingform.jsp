<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/infowritingform.css">
    <title>Document</title>
    <script src="https://kit.fontawesome.com/7aca531ae5.js" crossorigin="anonymous"></script>
</head>
<body>
    <form id="post_form" action="infowriting" method="post">
    <div class="image_wrap">
         <label for="image_file" class="image_file_zone" id="image_file_zone">
            <div class="image_fileholder" id="image_fileholder">사진추가</div>
         </label>
         <input type="file" id="image_file" class="image_file" multiple="multiple" hidden>
    </div>
    <div class="post_tit">
        <input type="text" class="tit" name="boardTitle" placeholder="제목을 입력하세요.">
    </div>
    <div class="post_contents">
        <textarea class="contents" name="boardContents" placeholder="내용을 입력하세요."></textarea>
    </div>
    <div class="post_btn">
    <button type="submit" id="submit_btn">작성하기</button>
    </div>  
    </form>
   
    <script>
        (function imageView(image_fileholder, image_file) {
  var fileHolder = document.getElementById(image_fileholder);
  var imageFile = document.getElementById(image_file);
  var sel_files = [];

  // 이미지와 체크 박스를 감싸고 있는 div 속성
  var div_style =
    'display:inline-block;position:relative;' +
    'width:600px;height:400px;margin:5px;border:1px solid #00f;z-index:3';
  // 미리보기 이미지 속성
  var img_style = 'width:100%;height:100%;z-index:2';
  // 이미지안에 표시되는 체크박스의 속성
  var chk_style =
    'width:30px;height:30px;position:absolute;font-size:24px;' +
    'right:0px;bottom:0px;z-index:999;background-color:rgba(255,255,255,0.1);color:#f00;z-index:1';

  imageFile.onchange = function (e) {
    var files = e.target.files;
    for (var f of files) {
      imageLoader(f);
    }
  };

  // 탐색기에서 드래그앤 드롭 사용
  fileHolder.addEventListener(
    'dragenter',
    function (e) {
      e.preventDefault();
      e.stopPropagation();
    },
    false
  );

  fileHolder.addEventListener(
    'dragover',
    function (e) {
      e.preventDefault();
      e.stopPropagation();
    },
    false
  );

  fileHolder.addEventListener(
    'drop',
    function (e) {
      e.preventDefault();
      e.stopPropagation();
      var files = e.dataTransfer.files;
      for (var f of files) {
        imageLoader(f);
      }
    },
    false
  );

  /* 첨부된 이미지를 배열에 넣고 미리보기 */
  function imageLoader(file) {
    console.log(file);
    sel_files.push(file);
    var reader = new FileReader();
    reader.onload = function (ee) {
      let img = document.createElement('img');
      img.setAttribute('style', img_style);
      img.src = ee.target.result;
      if (fileHolder.textContent == '사진추가') {
        fileHolder.textContent = '';
      }
      fileHolder.appendChild(makeDiv(img, file));
    };

    reader.readAsDataURL(file); // 단일 파일 객체를 읽어오도록 수정
  }

  /* 첨부된 파일이 있는 경우 checkbox와 함께 fileHolder에 추가할 div를 만들어 반환 */
  function makeDiv(img, file) {
    var div = document.createElement('div');
    div.setAttribute('style', div_style);

    var btn = document.createElement('input');
    btn.setAttribute('type', 'button');
    btn.setAttribute('value', 'x');
    btn.setAttribute('data-del-file', file.name || '');
    btn.setAttribute('style', chk_style);
    btn.onclick = function (ev) {
      ev.preventDefault(); 
      ev.stopPropagation(); // 이벤트 전파 중지
      var ele = ev.target;
      var delFile = ele.dataset.delFile || '';
      for (var i = 0; i < sel_files.length; i++) {
        if (delFile == sel_files[i].name) {
          sel_files.splice(i, 1);
          break; // 파일 찾았으면 반복문 종료
        }
      }
      var dt = new DataTransfer();
      for (var i = 0; i < sel_files.length; i++) {
        dt.items.add(new File([sel_files[i]], sel_files[i].name, { type: sel_files[i].type }));
      }
      imageFile.files = dt.files;
      var p = ele.parentNode;
      fileHolder.removeChild(p);
    };
    div.appendChild(img);
    div.appendChild(btn);
    return div;
  }
})('image_fileholder', 'image_file');

    </script>
</body>
</html>