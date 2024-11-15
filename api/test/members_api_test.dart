import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for MembersApi
void main() {
  final instance = Openapi().getMembersApi();

  group(MembersApi, () {
    // 어르신 연동 요청
    //
    // 어르신의 전화번호로 인증번호를 발송합니다. * SMS 또는 카카오톡으로 발송 가능 * 인증번호는 30분간 유효 
    //
    //Future<ApiMembersConnectRequestPost200Response> apiMembersConnectRequestPost(ConnectionRequest connectionRequest) async
    test('test apiMembersConnectRequestPost', () async {
      // TODO
    });

    // 어르신 연동 인증
    //
    // 발송된 인증번호를 확인하여 연동을 완료합니다. 
    //
    //Future apiMembersConnectVerifyPost(ConnectionVerify connectionVerify) async
    test('test apiMembersConnectVerifyPost', () async {
      // TODO
    });

    // 로그아웃
    //
    // 카카오 로그아웃을 수행합니다. 
    //
    //Future apiMembersLogoutPost() async
    test('test apiMembersLogoutPost', () async {
      // TODO
    });

    // 프로필 조회
    //
    //Future<ApiMembersProfileGet200Response> apiMembersProfileGet() async
    test('test apiMembersProfileGet', () async {
      // TODO
    });

    // 카카오 로그인/회원가입
    //
    // # 카카오 로그인 방법  ## 웹 브라우저 사용자 ### 개발 환경 - http://localhost:3000/api/members/social/kakao  ### 운영 환경 - https://dwph9988.shop/api/members/social/kakao  현재 서버: ${process.env.NODE_ENV === 'production' ? '운영' : '개발'} 접속 URL: ${process.env.SERVICE_URL}/api/members/social/kakao 
    //
    //Future apiMembersSocialKakaoGet() async
    test('test apiMembersSocialKakaoGet', () async {
      // TODO
    });

    // 회원 탈퇴
    //
    // 회원 탈퇴를 수행합니다. - 카카오 연동 해제 - DB에서 회원 정보 삭제 
    //
    //Future apiMembersWithdrawDelete() async
    test('test apiMembersWithdrawDelete', () async {
      // TODO
    });

  });
}
