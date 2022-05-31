-- =============================================
공고리스트
채용공고 스토리보드
-- =============================================

[uspGetAdminEmploymentList]

입력변수 @Searching nvarchar(100) -- 검색어
 ,@SearchType tinyint -- 0 전체 1 제목 2 내용
 , @EmployPart int  -- 지원구분 값 0 전체
 , @EmployType int -- 0 전체 1 법학대학원 2 해외로스쿨 3 기타전문가 4 직원공고
 , @EmployLang nvarchar(50)
 , @PeriodStart char(10) --시작기간
 , @PeriodEnd char(10) -- 종료기간
 , @Status tinyint -- 0 전체 1 게시 2 숨김
 , @ProcessStatus tinyint -- 모집상태 0: 전체 1: 대기 2: 진행중 3: 마감
 , @PageNumber int =1
 , @PageSize int =10
 

-- =============================================
공고갯수
채용공고 스토리보드
-- =============================================
[uspGetAdminEmploymentListCount]

입력변수 @Searching nvarchar(100) -- 검색어
 ,@SearchType tinyint -- 0 전체 1 제목 2 내용
 , @EmployPart int  -- 지원구분 값 0 전체
 , @EmployType int -- 0 전체 1 법학대학원 2 해외로스쿨 3 기타전문가 4 직원공고
 , @EmployLang nvarchar(50)
 , @PeriodStart char(10) --시작기간
 , @PeriodEnd char(10) -- 종료기간
 , @Status tinyint -- 0 전체 1 게시 2 숨김
 , @ProcessStatus tinyint -- 모집상태 0: 전체 1: 대기 2: 진행중 3: 마감
 , @PageNumber int =1
 , @PageSize int =10

 
 

-- =============================================
공고상세내용
채용공고 스토리보드
-- =============================================
[uspGetAdminEmploymentDetailList]
입력변수 @EmploymentNoticeID -- 공고테이블 아이디


-- =============================================
-- Author:		<조광호>
-- Create date: <Create Date,,>
-- Description:	<공고리스트 디데일 공고항목,,>
-- =============================================
[uspGetAdminEmploymentDetailSubList]
입력변수 @EmploymentNoticeID int -- 공고테이블 아이디
,@DetailLanguage int -- 언어



-- =============================================
-- Author:    <조광호>
-- Create date: <Create Date,,>
-- Description:  <메일인증 >
-- =============================================
Create PROCEDURE [dbo].[uspGetApplicantMail]
  -- Add the parameters for the stored procedure here
  @ApplicantID int
  
  

  
-- =============================================
-- Author:    <조광호>
-- Create date: <Create Date,,>
-- Description:  <공지사항 채용,,>
-- =============================================
Create PROCEDURE [dbo].[uspGetNoticeCareerList]
  -- Add the parameters for the stored procedure here
  @Lang char(2) -- KO EN
  
  
-- 로그인  
-- =============================================
-- Author:		<조광호>
-- Create date: <Create Date,,>
-- Description:	<지원자 로그인,,>
-- =============================================
[dbo].[uspGetApplicantLoginList] 





-- 지원서 작성 프로시저 

조 광호, [02.04.18 11:10]
-- 지원자 28페이지 개인정보 동의
ALTER Procedure [dbo].[uspSetApplicantBasicUpdate]
@ApplicantID int
,@CName nvarchar(50) --한문
,@EName nvarchar(50) -- 영어
,@ENameSecond nvarchar(50) -- Second영어
,@Phone char(13) -- 휴대전화
,@SosCellPhone char(13)
,@BirthDay smalldatetime
,@SolarYN tinyint
,@Sex tinyint
,@MyPhoto nvarchar(300)
,@ZipCode nvarchar(50)
,@Address nvarchar(300)
,@AddressETC nvarchar(300)
,@MilitaryYN tinyint --1: 필 2:미필 3: 면제 4:해당없음
,@MStartDate smalldatetime
,@MEndDate smalldatetime
,@MilitaryExplain nvarchar(300) -- 복무내용
,@Exempition nvarchar(300) -- 면제사유
,@VerteransYN tinyint --보훈여부 1:대상 2:비대상

조 광호, [02.04.18 11:11]
-- =============================================
-- Author:    <조광호>
-- Create date: <Create Date,,>
-- Description:  <Applicant update 39페이지,,>
-- =============================================
ALTER PROCEDURE [dbo].[uspSetApplicantAdd2Update]
  -- Add the parameters for the stored procedure here
         @ApplicantID int
        
           ,@Interest nvarchar(50) 
           ,@InterestSE nvarchar(50) 
           ,@InterestTH nvarchar(50) 
           ,@Introduce nvarchar(100) 
           ,@Memo nvarchar(100) 
           ,@WishIntern nvarchar(50) 
           ,@WishInternSE nvarchar(50)

조 광호, [02.04.18 11:11]
-- =============================================
-- Author:    <조광호>
-- Create date: <Create Date,,>
-- Description:  <Applicant Insert 44페이지,,>
-- =============================================
ALTER PROCEDURE [dbo].[uspSetApplicantFileUpdate]
  -- Add the parameters for the stored procedure here
         @ApplicantID int
        
           ,@FileName1 nvarchar(500) 
           ,@FileSize1 float 
           ,@FileName2 nvarchar(500) 
           ,@FileSize2 float 
           ,@FileName3 nvarchar(500) 
           ,@FileSize3 float 
           ,@FileName4 nvarchar(500) 
           ,@FileSize4 float 
           ,@FileName5 nvarchar(500) 
           ,@FileSize5 float 
           ,@FileName6 nvarchar(500) 
           ,@FileSize6 float 
           ,@FileName7 nvarchar(500) 
           ,@FileSize7 float

조 광호, [02.04.18 11:12]
-- =============================================
-- Author:    <조광호>
-- Create date: <Create Date,,>
-- Description:  <Applicant Insert StoryBoard 23페이지,,>
-- =============================================
ALTER PROCEDURE [dbo].[uspSetApplicantLoginInsert]
  -- Add the parameters for the stored procedure here
          @EmploymentNoticeID int
           ,@ID varchar(50) 
           ,@Account nvarchar(30) 
           ,@Password varchar(300) 
           ,@AName nvarchar(50)

조 광호, [02.04.18 11:12]
-- =============================================
-- Author:    <조광호>
-- Create date: <Create Date,,>
-- Description:  <Applicant 비번 변경>
-- =============================================
ALTER PROCEDURE [dbo].[uspSetApplicantPasswordUpdate]
  -- Add the parameters for the stored procedure here
  @ApplicantID int, @Password varchar(300)
AS
BEGIN
  -- SET NOCOUNT ON added to prevent extra result sets from
  -- interfering with SELECT statements.
  SET NOCOUNT ON;

    -- Insert statements for procedure here
  Update Applicant Set Password = Hashbytes('SHA2_512', @Password) Where  ApplicantID = @ApplicantID

End

조 광호, [02.04.18 11:13]
-- 조광호
-- 자격관련 입력
ALTER Procedure [dbo].[uspSetCertificationCareerInsert] 

           @EmploymentNoticeID int
           ,@ApplicantID int
           ,@Seq tinyint
           ,@Certification nvarchar(200)
           ,@Agency nvarchar(100)
           ,@ReceiveDate smalldatetime

조 광호, [02.04.18 11:13]
-- 조광호
-- 자격관련 수정
ALTER Procedure [dbo].[uspSetCertificationCareerUpdate]

           @CertificationCareerID int
           ,@ApplicantID int
           ,@Seq tinyint
           ,@Certification nvarchar(200)
           ,@Agency nvarchar(100)
           ,@ReceiveDate smalldatetime
           ,@Status tinyint
           ,@CreateDate smalldatetime

조 광호, [02.04.18 11:13]
-- 조광호
-- 가족 입력
ALTER Procedure [dbo].[uspSetFamilyCareerInsert]

           @EmploymentNoticeID int
           ,@ApplicantID int
           ,@Seq tinyint
           ,@FName nvarchar(50)
           ,@Relation nvarchar(50)
           ,@Age int

조 광호, [02.04.18 11:14]
-- 조광호
-- 가족관련 수정
ALTER Procedure [dbo].[uspSetFamilyCareerUpdate]

           @FamilyCareerID int
           ,@Seq tinyint
           ,@FName nvarchar(50)
           ,@Relation nvarchar(50)
           ,@Age int

조 광호, [02.04.18 11:14]
--학력입력
ALTER Procedure [dbo].[uspSetGraduationCareerInsert]

           @EmploymentNoticeID int
           ,@ApplicantID int
           ,@Seq tinyint
           ,@SName nvarchar(50)
           ,@SType tinyint
           ,@Location nvarchar(100)
       ,@InSchoolDate smalldatetime
           ,@OutSchoolDate smalldatetime
           ,@StatusYN tinyint
           ,@TransferYN tinyint
           ,@Major nvarchar(50)
           ,@MajorType tinyint
           ,@MajorSE nvarchar(50)
           ,@MajorTypeSE tinyint
           ,@MajorTH nvarchar(50)
           ,@MajorTypeTH tinyint
           ,@MajorFO nvarchar(50)
           ,@MajorTypeFO tinyint
           ,@MajorFI nvarchar(50)
           ,@MajorTypeFI tinyint
           ,@Department nchar(10)
           ,@Value float
           ,@TotalValue float
           ,@Etc nvarchar(50)

조 광호, [02.04.18 11:14]
--학력수정
ALTER Procedure [dbo].[uspSetGraduationCareerUpdate]

          @GraduationCareerID int
           ,@Seq tinyint
           ,@SName nvarchar(50)
           ,@SType tinyint
           ,@Location nvarchar(100)
       ,@InSchoolDate smalldatetime
           ,@OutSchoolDate smalldatetime
           ,@StatusYN tinyint
           ,@TransferYN tinyint
           ,@Major nvarchar(50)
           ,@MajorType tinyint
           ,@MajorSE nvarchar(50)
           ,@MajorTypeSE tinyint
           ,@MajorTH nvarchar(50)
           ,@MajorTypeTH tinyint
           ,@MajorFO nvarchar(50)
           ,@MajorTypeFO tinyint
           ,@MajorFI nvarchar(50)
           ,@MajorTypeFI tinyint
           ,@Department nchar(10)
           ,@Value float
           ,@TotalValue float
           ,@Etc nvarchar(50)

조 광호, [02.04.18 11:14]
-- 조광호
-- 직업 입력
ALTER Procedure [dbo].[uspSetJobCareerInsert] 

           @EmploymentNoticeID int
           ,@ApplicantID int
           ,@Seq tinyint
           ,@CompanyName nvarchar(100)
           ,@CareerStartDate smalldatetime
           ,@CareerEndDate smalldatetime
           ,@Department nvarchar(50)
           ,@Position nvarchar(50)
           ,@WorkExplain nvarchar(100)

조 광호, [02.04.18 11:15]
-- 조광호
-- 직업 입력
ALTER Procedure [dbo].[uspSetJobCareerUpdate]

           @JobCareerID int
           ,@Seq tinyint
           ,@CompanyName nvarchar(100)
           ,@CareerStartDate smalldatetime
           ,@CareerEndDate smalldatetime
           ,@Department nvarchar(50)
           ,@Position nvarchar(50)
           ,@WorkExplain nvarchar(100)

조 광호, [02.04.18 11:15]
-- 조광호
-- 언어 입력
ALTER Procedure [dbo].[uspSetLanguageCareerInsert] 

           @EmploymentNoticeID int
           ,@ApplicantID int
           ,@Seq tinyint
           ,@Language nvarchar(50)
           ,@CSubID int
           ,@Grade int
           ,@GradeName nvarchar(50)
           ,@Value float
           ,@TotalValue float
       ,@ReceiveDate tinyint

조 광호, [02.04.18 11:15]
-- 조광호
-- 언어 입력
ALTER Procedure [dbo].[uspSetLanguageCareerUpdate] 

           @LanguageCareerID int
           ,@Seq tinyint
           ,@Language nvarchar(50)
           ,@CSubID int
           ,@Grade int
           ,@GradeName nvarchar(50)
           ,@Value float
           ,@TotalValue float
       ,@ReceiveDate tinyint

조 광호, [02.04.18 11:16]
-- 조광호
-- 상 입력
ALTER Procedure [dbo].[uspSetPrizeCareerInsert] 

           @EmploymentNoticeID int
           ,@ApplicantID int
           ,@ContestName nvarchar(50)
           ,@PrizeName nvarchar(50)
           ,@PrizeAgency nvarchar(50)
           ,@PrizeDate smalldatetime

조 광호, [02.04.18 11:16]
-- 조광호
-- 상 업데이트
ALTER Procedure [dbo].[uspSetPrizeCareerUpdate] 

           @PrizeCareerID int
           ,@ContestName nvarchar(50)
           ,@PrizeName nvarchar(50)
           ,@PrizeAgency nvarchar(50)
           ,@PrizeDate smalldatetime

조 광호, [02.04.18 11:16]
-- 조광호
-- 과목 입력
ALTER Procedure [dbo].[uspSetSubjectCareerInsert] 

           @EmploymentNoticeID int
           ,@ApplicantID int
           ,@Subject nvarchar(50)
           ,@Value int
           ,@Grade float

조 광호, [02.04.18 11:16]
-- 조광호
-- 과목 수정
ALTER Procedure [dbo].[uspSetSubjectCareerUpdate] 

           @SubjectID int
           ,@Subject nvarchar(50)
           ,@Value int
           ,@Grade float
  
  