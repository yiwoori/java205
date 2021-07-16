//회원의 정보 : 아이디, 비밀번호, 이름
//Member:  생성자 함수 정의
function Member(id, pw, name) {
    this.userid = id;
    this.pw = pw;
    this.username = name;
};

//객체가 가지는 메소드는 공통으로 사용 : prototype
Member.prototype.makeHtml = function() {
    return '[ id : '+this.userId+', pw : '+this.pw+', name : '
    +this.userName+' ]'
};

//회원의 정보를 저장하는 배열
var members = []; //new Array();



$(document).ready(function(){

    if(localStorage.getItem('members')==null) {
        //배열 members를 저장
        localStorage.setItem('members', JSON.stringify(members));
    } else {
        members=JSON.parse(localStorage.getItem('members')); //JSON 문자열 -> 객체로 변환
        console.log(members);
        //테이블 세팅
        setList();
    }

    var id = $('#userID');
    var pw = $('#pw');
    var repw = $('#repw');
    var name = $('#userName');

    //regform 캐스팅
    $('#regForm').submit(function(){

        var chkId = /\w+@\w+\.\w+/;

        //아이디
        if(id.val().trim().length<1) {
            $('#userID+div.msg').html('필수항목').css('display','block');
            return false;
        }

        //아이디 형식 체크
        if(!chkId.test(id.val())){
            $('#userID + .msg').html('이메일 형식으로 입력해주세요').css('display', 'block');
            return false;
        }

        //비밀번호
        if(pw.val().trim().length<1) {
            $('#pw+div.msg').html('필수항목').css('display', 'block');
            return false;
        }

        //비밀번호확인
        if(repw.val().trim().length<1) {
            $('#repw+div.msg').html('필수항목').css('display', 'block');
            return false;
        }

        //비밀번호 일치
        if(pw.val().trim() != repw.val().trim()) {
            $('#repw+div.msg').html('비밀번호 불일치').css('display', 'block');
            return false;
        }

        //이름
        if(name.val().trim().length<1) {
            $('#userName+div.msg').html('필수항목').css('display', 'block');
            return false;
        }

        //배열에 사용자 정보 추가
        members.push(new Member(id.val(), pw.val(), name.val()));

        //저장
        localStorage.setItem('members', JSON.stringify(members));

        alert('등록 완료');
        console.log('회원리스트', members);

        this.reset();
        setList();

        return false;

    });

    $(id).focus(function(){
        $('#userID+div.msg').css('display', 'block').html('');
    });
    $(pw).focus(function(){
        $('#pw+div.msg').css('display', 'block').html('');
    });
    $(repw).focus(function(){
        $('#repw+div.msg').css('display', 'block').html('');
    });
    $(name).focus(function(){
        $('#userName+div.msg').css('display', 'block').html('');
    });

});



//배열에 있는 요소를 -> table의 tr행을 만들어 출력
function setList() {

    var list = $('#list');

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
            tbody += '  <td>'+members[i].userid+'</td>';
            tbody += '  <td>'+members[i].pw+'</td>';
            tbody += '  <td>'+members[i].username+'</td>';
            tbody += '  <td> <a href="javascript:editMember('+i+')">수정</a> | <a href="javascript:deleteMember('+i+')">삭제</a></td>';
            tbody += '</tr>';
        }
    }
    $('#list').html(tbody);
};



    //배열의 요소 삭제
    function deleteMember(index) {

        //배열의 index 요소를 삭제
        if(confirm('삭제하시겠습니까?')) {
            members.splice(index,1); //(삭제코드)
            alert('삭제 완료');

            //저장
            localStorage.setItem('members', JSON.stringify(members));
            
            //테이블 리스트 갱신 (삭제 반영 리스트)
            setList();
        }
    }



    //배열의 요소 수정
    function editMember(index) {

        $('#editFormArea').css('display', 'block');

        $('#editId').val(members[index].userid);
        $('#editPw').val(members[index].pw);
        $('#editRePw').val(members[index].pw);
        $('#editName').val(members[index].username);
        $('#index').val(index);

        $('#editForm').submit(function(){

            if(editPw.val() != editRePw.val()) {
                alert('비밀번호 불일치');
                return false;
            }

            if(!confirm('수정하시겠습니까?')) {
                return false;
            }

            members[$('#index').val()].pw = $('#editPw').val();
            members[$('#index').val()].username = $('#editName').val();

            localStorage.setItem('members', JSON.stringify(members));
            alert('수정 완료');

            setList();
            editMemberClose();
            return false;



        });

    }

    function editMemberClose() {
        $('#editFormArea').css('display', 'none');
    }
