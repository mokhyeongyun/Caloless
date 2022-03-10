/*운동기록 등록 폼체크 */
function erinsertFormCheck(){ // 운동기록지 등록 폼체크
    let year, month, day, inout, kind, hour, minute, second;
    year=document.getElementById("year");
    month=document.getElementById("month");
    day=document.getElementById("day");
    inout=document.getElementById("inout");
    kind=document.getElementById("kind");
    hour=document.getElementById("hour");
    minute=document.getElementById("minute");
    second=document.getElementById("second");
    
    if(year.value == "" || month.value == "" || day.value == ""){
        alert("운동날짜를 입력해주세요");
        return false;
    }else if(inout.value == "none"){
        alert("운동환경을 선택해주세요");
        return false;
    }else if(kind.value == "none"){
        alert("운동종류를 선택해주세요");
        return false;
    }else if(hour.value == "0" && minute.value == "0" && second.value == "0"){
        alert("운동시간을 입력해주세요");
        return false;
    }else {
        if(confirm("운동을 기록하시겠습니까?")){
            alert("기록이 완료되었습니다. 운동기록지로 돌아갑니다.")
            document.record_form.submit();
        }else{
            
        }
    }
}

//운동기록 등록 날짜, 시간 폼 설정
function erdateFormCheck(){
    let year, month, day, hour, minute, second;
    year=document.getElementById("year");
    month=document.getElementById("month");
    day=document.getElementById("day");
    hour=document.getElementById("hour");
    minute=document.getElementById("minute");
    second=document.getElementById("second");
    if(year.value<1950){
        year.value=1950;
        return false;
    }else if(year.value>2100){
        year.value=2100;
        return false;
    }else if(month.value<1){
        month.value=1;
        return false;
    }else if(month.value>12){
        month.value=12;
        return false;
    }else if(day.value<1){
        day.value=1;
        return false;
    }else if(day.value > 31){
        day.value =31;
        return false;
    }else if(hour.value < 0){
        hour.value =0;
        return false;
    }else if(hour.value > 11){
        hour.value =11;
        return false;
    }else if(minute.value < 0){
       minute.value =0;
        return false;
    }else if(minute.value > 59){
        minute.value =59;
        return false;
    }else if(second.value < 0){
        second.value =0;
        return false;
    }else if(second.value > 59){
        second.value =59;
        return false;
    }
}
function numberMaxLength(e){ // 글자수 제한
        if(e.value.length > e.maxLength){
            e.value = e.value.slice(0, e.maxLength);
     }
}

function selectClick(){ // 첫 select 값에 따라 두번째 select 값 변화
    let inout, kindin, kindout,kind;
    inout= document.getElementById("inout");
    kind= document.getElementById("kind");
    kindin= document.getElementsByName("실내운동");
    kindout= document.getElementsByName("실외운동");
    
    if(inout.value =="inside"){
        kind.value="none";
        for(let i =0;i<kindin.length;i++ ){
            kindin[i].style.display ='block';
             if(i==kindin.length){
                break;
            }
        }
        for(let i =0;i<=kindout.length;i++ ){
            kindout[i].style.display ='none';
            if(i==kindout.length){
                break;
            }
        }
    }else if(inout.value =="outside"){
        kind.value="none";
         for(let i =0;i<kindin.length;i++ ){
            kindin[i].style.display ='none';
            if(i==kindin.length){
                break;
            }
        }
        for(let i =0;i<=kindout.length;i++ ){
            kindout[i].style.display ='block';
             if(i==kindout.length){
                break;
            }
        }
    }else{
        kind.value="none";
         for(let i =0;i<kindin.length;i++ ){
            kindin[i].style.display ='none';
            if(i==kindin.length){
                break;
            }
        }
        for(let i =0;i<=kindout.length;i++ ){
            kindout[i].style.display ='none';
             if(i==kindout.length){
                break;
            }
        }
    }
    
}


//------------------------------------
/*운동기록 수정 폼체크 */
function erupdateFormCheck(){ // 운동기록지 수정 유효성 폼체크
    let inout, kind, hour, minute, second;
    inout=document.getElementById("inout");
    kind=document.getElementById("kind");
    hour=document.getElementById("hour");
    minute=document.getElementById("minute");
    second=document.getElementById("second");
   if(inout.value == "none"){
        alert("운동환경을 선택해주세요");
        inout.focus();
        return false;
    }else if(kind.value == "none"){
        alert("운동종류를 선택해주세요");
        kind.focus();
        return false;
    }else if(hour.value == "0" && minute.value == "0" && second.value == "0"){
        alert("운동시간을 입력해주세요");
        second.focus();
        return false;
    }else {
        if(confirm("운동기록을 수정하시겠습니까?")){
            document.record_form.submit();
        }else{
            
        }
    }
}
function erdeleteFormCheck(frm){
    if(confirm("운동기록을을 삭제하시겠습니까?")){
        frm.action = '../record_delete_proc.jsp';
        frm.submit();
        return true;
    }
}

function erupdatetimeFormCheck(){ //수정화면 시간 제어
    let hour, minute, second;
    hour=document.getElementById("hour");
    minute=document.getElementById("minute");
    second=document.getElementById("second");
    if(hour.value < 0){
        hour.value =0;
        return false;
    }else if(hour.value > 11){
        hour.value =11;
        return false;
    }else if(minute.value < 0){
        minute.value =0;
        return false;
    }else if(minute.value > 59){
        minute.value =59;
        return false;
    }else if(second.value < 0){
        second.value =0;
        return false;
    }else if(second.value > 59){
        second.value =59;
        return false;
    }
}
function nowyear(){ //현재날짜 운동기록등록에 기록
    let date = new Date();
    let year = date.getFullYear();
    let month = date.getMonth()+1;
    let day = date.getDate();
    document.getElementById("year").value=year;
    document.getElementById("month").value=month;
    document.getElementById("day").value=day;
}


/**
    로그인 폼 체크
 */
function loginFormCheck(){
    let id, pass;
    id=document.getElementById("id");
    pass=document.getElementById("pass");
    
    if(id.value == ""){
        alert("아이디를 입력 해 주세요");
        id.focus();
        return false;
    }else if(pass.value == ""){
        alert("비밀번호를 입력 해 주세요");
        pass.focus();
        return false;
    }else{
        document.loginForm.submit();
    }
}

/*******************************************************
    회원가입 폼체크
 */


function nameMinLength(e){// 이름 글자수에 따른 경고문
     let nmsg=document.getElementById("nmsg");
     if(e.value.length < 2){
            nmsg.innerHTML="최소 2글자 이상";
     }else{
         nmsg.innerHTML="";
    }
}
function ageMinLength(e){
     let amsg=document.getElementById("amsg");
     if(e.value<10 || e.value>110){
         amsg.innerHTML="10 ~ 100 사이의 숫자를 입력해 주세요.";
    }else{
        amsg.innerHTML="";
    }
}

/**
 * 공지사항 글쓰기
 */
 function registCheck(){
    let ntitle,ncontent;
    ntitle=document.getElementById("ntitle");
    ncontent=document.getElementById("ncontent");
    
   if(ntitle.value==""){
        alert("제목을 입력해주세요.");
        ntitle.focus();
        return false;
    }else if(ncontent.value==""){
        alert("내용을 입력해주세요.");
        ncontent.focus();
        return false;
    }else{
        alert("등록 완료");
        notice_form.submit();
    }
}

/**
 * 공지사항 수정하기
 */
 function updateCheck(){
    let notice_update_title,notice_update_content;
    notice_update_title=document.getElementById("ntitle");
    notice_update_content=document.getElementById("ncontent");
    
    if(notice_update_title.value==""){
        alert("제목 입력")
        notice_update_title.focus();
        return false;
    }else {
        if(notice_update_content.value==""){
            alert("내용 입력")
            notice_update_content.focus();
            return false;
        }else{
            alert("수정 성공")
            notice_form.submit();
        }
    }
}


/**
 * 공지사항 상세보기 삭제
 */
 function notice_delete(){
    let ck = confirm("정말 삭제하시겠습니까?");
    if(ck==true){
        alert("삭제되었습니다.");
    }else{
        alert("삭제가 취소되었습니다.");
    }
    //DB연동 삭제
}

/**
    운동정보 등록 - 폼 체크
 */
 function insertFormCheck() {
    let eikind, eiinout, eikind2, eimet, eiadv, eiweak;
    eikind = document.getElementById("eikind");
    eiinout = document.getElementById("eiinout");
    eikind2 = document.getElementById("eikind2");
    eikind = document.getElementById("eikind");
    eimet = document.getElementById("eimet");
    eiadv = document.getElementById("eiadv");
    eiweak = document.getElementById("eiweak");
    
    if (eikind.value == "") {
        alert("운동명을 입력해주세요.");
        eikind.focus();
        return false;
    }else if (eiinout.value == "") {
        alert("운동환경을 입력해주세요.");
        eiinout.focus();
        return false;
    }else if (eikind2.value == "") {
        alert("운동종류를 입력해주세요.")
        eikind2.focus();
        return false;
    }else if (eimet.value == "") {
        alert("MET를 입력해주세요.")
        eimet.focus();
        return false;
    }else if (eiadv.value == "") {
        alert("장점을 입력해주세요.");
        eiadv.focus();
        return false;
    }else if (eiweak.value == "") {
        alert("단점을 입력해주세요.");
        eiweak.focus();
        return false;
    }else {
        INFO_REGIST.submit();
        window.location.href = 'INFO_LIST.jsp';
    }
}
 
/**
    운동정보 수정 - 폼 체크
 */ 
function updateFormCheck() {
    let eikind, eiinout, eikind2, eimet, eiadv, eiweak;
    eikind = document.getElementById("eikind");
    eiinout = document.getElementById("eiinout");
    eikind2 = document.getElementById("eikind2");
    eimet = document.getElementById("eimet");
    eiadv = document.getElementById("eiadv");
    eiweak = document.getElementById("eiweak");
    
     if (eikind.value == "") {
        alert("운동명을 입력해주세요.");
        eikind.focus();
        return false;
    }else if (eiinout.value == "") {
        alert("운동환경을 입력해주세요.");
        eiinout.focus();
        return false;
    }else if (eikind2.value == "") {
        alert("운동종류를 입력해주세요.")
        eikind2.focus();
        return false;
    }else if (eimet.value == "") {
        alert("MET를 입력해주세요.")
        eimet.focus();
        return false;
    }else if (eiadv.value == "") {
        alert("장점을 입력해주세요.");
        eiadv.focus();
        return false;
    }else if (eiweak.value == "") {
        alert("단점을 입력해주세요.");
        eiweak.focus();
        return false;
    }else {
        INFO_MODIFY.submit();
    }
    
}

/**
    운동정보 삭제
 */ 
 function submit2(frm) { 
    frm.action='두번째로 보낼 경로'; 
    frm.submit(); 
    return true; 
  } 
 
 /**
    운동정보 검색
 */ 
 function enterkey() {
        if (window.event.keyCode == 13) {
 
             // 엔터키가 눌렸을 때 실행할 내용
             login();
        }
}

function infoNullCheck() {
    let name = document.getElementById("name");
    let email = document.getElementById("email");
    let id = document.getElementById("id");
    let password = document.getElementById("password");
    let height = document.getElementById("height");
    let weight = document.getElementById("weight");
    let age = document.getElementById("age");
    let gender = document.getElementById("gender");
    let nameMsg = document.getElementById("nameMsg");
    let ageMsg = document.getElementById("ageMsg");
    let emailMsg = document.getElementById("emailMsg");
    let idMsg = document.getElementById("idMsg");
    let pwMsg = document.getElementById("pwMsg");
    let genderMsg = document.getElementById("genderMsg");
    let heightMsg = document.getElementById("heightMsg");
    let weightMsg = document.getElementById("weightMsg");
    
    
  if(name.value == "") {
    alert("이름을 입력해 주세요");
    name.focus();
    return false;
  } else if(email.value == "") {
    alert("이메일을 입력해 주세요");
    email.focus();
    return false;
  } else if(id.value == "") {
    alert("아이디를 입력해 주세요");
    id.focus();
    return false;
  } else if(password.value == "") {
    alert("비밀번호를 입력해 주세요");
    password.focus();
    return false;
  } else if(height.value == "") {
    alert("키를 입력해 주세요");
    height.focus();
    return false;
  } else if(weight.value == "") {
    alert("몸무게를 입력해 주세요");
    weight.focus();
    return false;
  }else{
    if(nameMsg.innerText != "") {
    alert("이름 형식이 잘못되었습니다.");
    name.focus();
  }  else if(ageMsg.innerText != "") {
    alert("나이 형식이 잘못되었습니다.");
    age.focus();
  }else if(emailMsg.innerText != "") {
    alert("이메일 형식이 잘못되었습니다.");
    email.focus();
  } else if(idMsg.innerText != "") {
    alert("아이디 형식이 잘못되었습니다.");
    id.focus();
  } else if(pwMsg.innerText != "") {
    alert("비밀번호 형식이 잘못되었습니다.");
    password.focus();
  } else if(genderMsg.innerText != "") {
    alert("성별 형식이 잘못되었습니다.");
    gender.focus();
  } else if(heightMsg.innerText != "") {
    alert("키 형식이 잘못되었습니다.");
    height.focus();
  } else if(weightMsg.innerText != "") {
    alert("몸무게 형식이 잘못되었습니다.");
    weight.focus();
  }else{
    alert("회원가입이 완료되었습니다.");
    document.userInfo.submit();
    }
}
}

function loginNullCheck() {
    let login_id = document.getElementById("id");
    let login_pw = document.getElementById("password");
    
    
    if(login_id.value == "" || login_id.value == null || login_id.value == undefined) {
        alert("아이디를 입력해 주세요");
        login_id.focus();
        return false;
    } else if(login_pw.value == "" || login_pw.value == null || login_pw.value == undefined) {
        alert("비밀번호를 입력해 주세요");
        login_pw.focus();
        return false;
    }else {
        document.loginform.submit();
    }
}

function nameCheck() {
    let name = document.getElementById("name");
    let nameMsg = document.getElementById("nameMsg");
    var pattern_num = /[0-9]/;  // 숫자 
    var pattern_eng = /[a-zA-Z]/;   // 문자 
    var pattern_spc = /[.,~!@#$%^&*()_+|<>?:{}]/; // 특수문자
    var pattern_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; // 한글체크
    var pattern_spa = /\s/g; // 공백체크
    if( (pattern_num.test(name.value)) ) {
        nameMsg.innerHTML = "숫자는 사용하실 수 없습니다."
        return false;
    } else if( (pattern_spc.test(name.value)) ) {
        nameMsg.innerHTML = "특수기호는 사용하실 수 없습니다."
        return false;
    } else if (pattern_spa.test(name.value)){
        nameMsg.innerHTML = "이름에 공백이 있어요!!!"
        return false;
    } else if (name.value == "" || name.value == null || name.value == undefined) {
        nameMsg.innerHTML = "";
        return true;
    } else if( (pattern_eng.test(name.value)) || (pattern_kor.test(name.value)) ) {
        nameMsg.innerHTML = "";
        return true;
    }
}

function ageCheck() {
    let age = document.getElementById("age");
    let ageMsg = document.getElementById("ageMsg");
    var check_num = /[0-9]/;
    if( (check_num.test(age.value))) {
        if(age.value.length == 1) {
            ageMsg.innerHTML = "너무 젊어서 안되는데 어쩔티비?!"
            return false;
        } else if(age.value.length > 3) {
            ageMsg.innerHTML = "나이가 너무 많으신데... 혹시 단군이신가요?"
            return false;
        } else if( !(20 <= age.value && age.value <= 120) ) {
            ageMsg.innerHTML = "나이는 20세 ~ 120세 사이입니다."
            return false;
        } else {            
        ageMsg.innerHTML = "";
        return true;
        }
    }
}

function emailCheck() {
    let email = document.getElementById("email");
    let emailMsg = document.getElementById("emailMsg");
    var reg_email =/([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,20})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
    if( (reg_email.test(email.value))) {
        emailMsg.innerHTML = "";
        return true;
    } else {
        if(email.value == "" || email.value == null || email.value == undefined) {
            return false;
        } else {
            emailMsg.innerHTML = "이메일이 잘못되었습니다. 오타작렬이군요?!"
            return false;
        }
    }
}

function idCheck() {
    let id = document.getElementById("id");
    let idMsg = document.getElementById("idMsg");
    var reg_id = /^[a-z0-9]{4,20}$/;
    if( (reg_id.test(id.value))) {
        idMsg.innerHTML = "";
        return true;
    } else {
        if(id.value == "" || id.value == null || id.value == undefined) {
            return false;
        } else {
            idMsg.innerHTML = "ID는 영어, 숫자만 사용하여 4~20자 사이로 입력해주세요."
            return false;
        }
    }
}

function pwCheck() {
    let password = document.getElementById("password");
    let pwMsg = document.getElementById("pwMsg");
    var reg_pw =  /^(?=.*[a-z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{4,20}/;

    if( (reg_pw.test(password.value))) {
        pwMsg.innerHTML = "";
        return true;
    } else {
        if(password.value == "" || password.value == null || password.value == undefined) {
            return false;
        } else {
            pwMsg.innerHTML = "비밀번호는 영어,특수문자,숫자 1개이상 포함하여 최소8자."
            return false;
        }
    }
}

function genderCheck() {
    let gender = document.getElementById("gender");
    let genderMsg = document.getElementById("genderMsg");
    if(gender.value == "" || gender.value == null || gender.value == undefined) {
        genderMsg.innerHTML = "남성분은 'M' 여성분은 'F'만 입력해 주세요."
        return false;
    } else {
        if( !((gender.value == "M") || (gender.value == "F")) ) {
            genderMsg.innerHTML = "남성분은 'M' 여성분은 'F'만 입력해 주세요."
            return false;       
        } else {
            genderMsg.innerHTML = "";
            return true;
        }
    }
}

function heightCheck() {
    let height= document.getElementById("height");
    let heightMsg = document.getElementById("heightMsg");
    var check_num = /[0-9]/;
    if( (check_num.test(height.value))) {
        if(30 > height.value) {
            heightMsg.innerHTML = "이게 키야?!"
            return false;
        } else if(230 < height.value) {
            heightMsg.innerHTML = "키가 크신데 저에게 좀 나눠줄래요?"
            return false;
        } else {            
        heightMsg.innerHTML = "";
        return true;
        }
    }
}

function weightCheck() {
    let weight= document.getElementById("weight");
    let weightMsg = document.getElementById("weightMsg");
    var check_num = /[0-9]/;
    if( (check_num.test(weight.value))) {
        if(weight.value.length == 1) {
            weightMsg.innerHTML = "이게 몸무게야?!"
            return false;
        } else if(weight.value.length > 3) {
            weightMsg.innerHTML = "엄... 혹시 당신은 트렌스포머인가요?"
            return false;
        } else if( !(30 <= weight.value && weight.value <= 200) ) {
            weightMsg.innerHTML = "몸무게는 30kg ~ 200kg 사이입니다."
            return false;
        } else {            
        weightMsg.innerHTML = "";
        return true;
        }
    }
}

 function mypageUdateCheck(){
    let name = document.getElementById("uname");
    let email = document.getElementById("uemail");
    let id = document.getElementById("userid");
    let password = document.getElementById("upw");
    let height = document.getElementById("uheight");
    let weight = document.getElementById("uweight");
    let gender = document.getElementById("ugender");
    
  if(name.value == "") {
    alert("이름을 입력해 주세요");
    name.focus();
    return false;
  } else if(email.value == "") {
    alert("이메일을 입력해 주세요");
    email.focus();
    return false;
  } else if(id.value == "") {
    alert("아이디를 입력해 주세요");
    id.focus();
    return false;
  } else if(password.value == "") {
    alert("비밀번호를 입력해 주세요");
    password.focus();
    return false;
  } else if(height.value == "") {
    alert("키를 입력해 주세요");
    height.focus();
    return false;
  } else if(weight.value == "") {
    alert("몸무게를 입력해 주세요");
    weight.focus();
    return false;
    }else if(gender.value == "") {
    alert("성별을 입력해 주세요");
    weight.focus();
    return false;
  }else{
    alert("수정이 완료되었습니다.");
    document.mypageform.submit();
}
    
}

function findIdCheck() {
    let name = document.getElementById("idfindname");
    let email = document.getElementById("idfindemail");
    let pid = document.getElementById("pwfindid");
    let pemail = document.getElementById("pwfindemail");
    
  if(name.value == "") {
    alert("이름을 입력해 주세요");
    name.focus();
    return false;
  } else if(email.value == "") {
    alert("이메일을 입력해 주세요");
    email.focus();
    return false;
  } else{
    pid.value="";
    pemail.value="";
    document.findform.submit();
}
}

function findPwCheck() {
    let id = document.getElementById("pwfindid");
    let email = document.getElementById("pwfindemail");
    let iname = document.getElementById("idfindname");
    let iemail = document.getElementById("idfindemail");
    
  if(id.value == "") {
    alert("id를 입력해 주세요");
    id.focus();
    return false;
  } else if(email.value == "") {
    alert("이메일을 입력해 주세요");
    email.focus();
    return false;
  } else{
    iname.value="";
    iemail.value="";
    document.findform.submit();
}
}











