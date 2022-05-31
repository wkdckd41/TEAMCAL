/**
 * @description alumni 파일업로드
 */
$(function(){
	// fileupload button click
	var _arrFiles = [];
	$(document).on('click','[data-name="fileBtn"]',function(){
		var $fileOpen = $('[data-name="fileOpen"]');
		$fileOpen.trigger('click');
	});

	// fileupload file change
	$(document).on('change','[data-name="fileOpen"]',function(){
		var $fileOpen = $('[data-name="fileOpen"]');
		var $fileArea = $('[data-name="fileArea"]');
		var _len = $fileOpen[0].files.length;
		var _fileName = '';

		// 첨부 가능한 개수 : 최대 5개 유효성 체크
		if(_len>5 || _len<1){
			return;
		}

		for(var i=0; i<_len; i++){
			_fileName += '<div>'
				+ 	'<span class="up_filename">'+$fileOpen[0].files[i].name+'</span>'
				+ 	'<span class="btn_close_wrap" data-name="fileDelete">'
				+		'<img src="../../../resources/images/alumni/common/btn_close.png">'
				+ 	'</span>'
				+ '</div>';

			_arrFiles[i] = $fileOpen[0].files[i];
		}

		$fileArea.html(_fileName).fadeIn();
	});

	// fileupload file delete
	$(document).on('click','[data-name="fileDelete"]',function(){
		var $fileOpen = $('[data-name="fileOpen"]');
		var _fileText = $(this).siblings('.up_filename').text();
		var _len =_arrFiles.length;

		for(var i=0; i<_len; i++){
			if($fileOpen[0].files[i].name === _fileText){
				_arrFiles.splice(i, 1);
			}
		}

		$(this).parent('div').remove();
	});
});
