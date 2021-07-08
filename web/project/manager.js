//회원의 정보 : 아이디, 비밀번호, 이름
//Member라는 생성자 함수를 정의

function Member(id, pw, name) {
    this.userId = id;
    this.pw = pw;
    this.userName = name;
};

//객체가 가지는 메소드는 공통으로 사용 : prototype
Member.prototype.makeHtml = function() {
    return '[ id : '+this.userId+', pw : '+this.pw+', name : '
    +this.userName+' ]'
};
/////////////////////////////

//회원의 정보를 저장하는 배열
var members = []; //[] or new Array();

/////////////////////////////

//사용자가 입력한 정보를 가지고 Member객체를 생성
//submit 이벤트 연결
window.onload = function() {

    //테이블 세팅
    setList();

    var userid = document.querySelector('#userID');
    var pw = document.querySelector('#pw');
    var repw = document.querySelector('#repw');
    var userName = document.querySelector('#userName');

    //regform 캐스팅
    var regForm = document.getElementById('regForm');

    regForm.onsubmit = function() {

        //사용자가 입력한 값
        // var userid = document.querySelector('#userID').value; //value=text 반환
        // var pw = document.querySelector('#pw').value;
        // var repw = document.querySelector('#repw').value;
        // var userName = document.querySelector('#userName').value;

        //if(userid.trim().length<1) {
        if(userid.value.trim().length<1) {
            //alert('아이디를 입력해주세요');
            document.querySelector('#userID+div.msg').innerHTML='필수항목입니다.';
            document.querySelector('#userID+div.msg').style.display='block';
            return false; //더 내려가지x
        }

        // if (pw.trim().length < 1 ) {
        if (pw.value.trim().length < 1 ) {
            //alert('비밀번호를 입력해주세요');
            document.querySelector('#pw+div.msg').innerHTML = '필수항목입니다.';
            document.querySelector('#pw+div.msg').style.display = 'block';
            return false;
        }

        //if (repw.trim().length < 1) {
        if (repw.value.trim().length < 1) {
            //alert('비밀번호를 입력해주세요');
            document.querySelector('#repw+div.msg').innerHTML = '필수항목입니다.';
            document.querySelector('#repw+div.msg').style.display = 'block';
            return false;
        }

        //비밀번호-비밀번호확인 일치 여부 체크
        //if(pw.trim()!=repw.trim()){
        if(pw.value.trim() != repw.value.trim()){
            //alert('비밀번호와 비밀번호 확인이 일치하지 않습니다.\n다시 확인해주세요.')
            document.querySelector('#repw+div.msg').innerHTML='일치하지 않습니다.';
            document.querySelector('#repw+div.msg').style.display='block';
           return false;
        }

        //if(userName.trim().length<1) {
        if(userName.value.trim()<1) {
            //alert('이름을 입력해주세요');
            document.querySelector('#userName+div.msg').innerHTML='필수항목입니다.';
            document.querySelector('#userName+div.msg').style.display='block';
            return false;
        }

        console.log(userid.value);
        console.log(pw.value);
        console.log(repw.value);
        console.log(userName.value);

        //객체 생성
        //var member = new Member(userid.value, pw.value, userName.value);
        //console.log(typeof member, member.makeHtml());

        //배열에 사용자 정보를 추가
        members.push(new Member(userid.value, pw.value, userName.value));

        alert('등록 완료');
        console.log('회원리스트', members);

        //form 초기화
        this.reset();

        //테이블 세팅
        setList();

        return false; //액션으로 가지 않음 : 등록 후 새창x
    }

    userid.addEventListener('focus', function(){ //focus:커서가 위치했을때 '필수항목~' 사라짐
        document.querySelector('#userID+div.msg').style.display='none';
        document.querySelector('#userID+div.msg').innerHTML = '';
    });

    pw.addEventListener('focus', function(){ 
        document.querySelector('#pw+div.msg').style.display='none';
        document.querySelector('#pw+div.msg').innerHTML = '';
    });

    repw.addEventListener('focus', function(){ 
        document.querySelector('#repw+div.msg').style.display='none';
        document.querySelector('#repw+div.msg').innerHTML = '';
        repw.focus();
        
    });

    userName.addEventListener('focus', function(){ 
        document.querySelector('#userName+div.msg').style.display='none';
        document.querySelector('#userName+div.msg').innerHTML = '';
    });

}

//배열에 있는 요소를 table의 tr행을 만들어 출력
function setList() {
    
    //table의 tbody 캐스팅
    var list = document.querySelector('#list');

    var tbody = '<tr>';
    tbody += '  <th>순번(index)</th>'
    tbody += '  <th>아이디</th>';
    tbody += '  <th>비밀번호</th>';
    tbody += '  <th>이름</th>';
    tbody += '  <th>관리</th>';
    tbody += '</tr>';

    if(members.length<1){
        tbody += '<tr>';
        tbody += '<td colspan="5">데이터가 존재하지 않습니다.</td>';
        tbody += '</tr>';
    } else {

        for(var i=0; i<members.length; i++) {
            tbody += '<tr>';
            tbody += '  <td>'+i+'</td>';
            tbody += '  <td>'+members[i].userId+'</td>';
            tbody += '  <td>'+members[i].pw+'</td>';
            tbody += '  <td>'+members[i].userName+'</td>';
            tbody += '  <td> <a href="javascript:editMember('+i+')">수정</a> | <a href="javascript:deleteMember('+i+')">삭제</a></td>';
            tbody += '</tr>';
        }
    }
    list.innerHTML = tbody;
}

    //배열의 요소 삭제 함수
    function deleteMember(index) {
        //alert(index+'인덱스의 요소를 삭제합니다');
        //var chk = confirm('삭제하시겠습니까?');

        //배열의 index 요소를 삭제
        //splice(index,count):index에서 시작해서 count만큼의 요소를 삭제하고 남은 요소의 배열을 반환
        //splice(index, 1)
        if(confirm('삭제하시겠습니까?')) {
            members.splice(index,1); //(삭제코드)
            alert('삭제되었습니다.');
            
            //테이블 리스트 갱신 (삭제 테이블 제외한 리스트)
            setList();
        }
    }

    //배열의 요소 수정 함수
    function editMember(index) {
        //alert(index+'인덱스의 요소를 수정합니다.');

        // 수정 폼 영역이 노출되어야 한다!
        document.querySelector('#editFormArea').style.display = 'block';

        //전달받은 index 값으로 members 배열의 객체 하나를 얻을 수 있다.
        console.log(index, members[index]);

        //editForm의 태그들의 value 값을 세팅
        var editUserId = document.querySelector('#editId');
        var editPw = document.querySelector('#editPw');
        var editRePw = document.querySelector('#editRePw');
        var editName = document.querySelector('#editName');
        var editIndex = document.querySelector('#index');

        //이전 데이터를 폼에 저장
        editUserId.value = members[index].userId;
        editPw.value = members[index].pw;
        editRePw.value = members[index].pw;
        editName.value = members[index].userName;
        editIndex.value = index;

        document.querySelector('#editForm').onsubmit = function() {
            // var member = new Member(editUserId.value, editPw.value, editName.value);
            // console.log(editIndex.value, member);

            //비밀번호와 비밀번호 확인이 같은지 체크
            if(editPw.value != editRePw.value){
                alert('비밀번호와 비밀번호 확인이 일치하지 않습니다.');
                return false;
            }

            if(!confirm('수정하시겠습니까?')) {
                return false;
            }

            members[editIndex.value].pw = editPw.value;
            members[editIndex.value].userName = editName.value;

            alert('수정 완료');
            setList();

            editMemberClose();
            return false;
        }
    }

    function editMemberClose() {
        document.querySelector('#editFormArea').style.display = 'none';
    }
