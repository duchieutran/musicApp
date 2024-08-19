# giới thiệu về dự án
 - Đây là một dự án tự thiết kế cũng như tự code, ý tưởng dựa trên project của khoá học FREE flutter Thân Triệu, cá nhân hoá dự án và thiết kế thêm.
 - Thời gian bắt đầu dự án : 15/08/2024
 - Thời gian kết thúc : Đây là 1 dự án được làm trong quá trình học cho nên chưa có thời gian kết thúc mà sẽ update dần 


# cách package dùng trong ứng dụng
 - mobx
 - flutter_screenutil
 - dio || http
 - sliding_clipped_nav_bar : custom BottomNavigatorBar
 - pretty_dio_logger : hiển thị các request và respose
 - just_audio : chưa tìm hiểu
 - rxdart : chưa tìm hiểu
 - audio_video_progress_bar : chưa tìm hiểu

 
# các kiến thức học được
 - xem lại được mobx, api và route, model

 - dùng screenutil để tuỳ chỉnh kích thước theo tỉ lệ màn hình:
  + designSize (Size(w, h)) : kích thước mặc định của toàn màn hình
  + minTextAdapt (bool) : thay đổi cỡ chữ theo tỉ lệ màn hình
  + splitScreenMode (bool) : nhận biết giao diện khi ở chế độ chia đôi màn hình

 - ThemeData của Material :
  + sử dụng Material3 : Có thể xem thêm ở GG => Túm cái váy lại là dùng tốt hơn
  + colorScheme : Định nghĩa màu xuyên suốt cho ứng dụng

 - ClipRRect : dùng để bo góc ảnh

 - Nếu cần truyền 2 tham số agruments thì có thể tạo 1 Map or 1 List (tham khảo agruments của Playing) 

 - cách dùng showBottomSheet trong 'lib\screens\home\home.dart' 

 - trong dùng pretty_dio_logger trong dio

 - RotationTransition: ảnh xoay (CHƯA TÌM HIỂU)

 - FadeInImage.assetNetwork : (CHƯA TÌM HIỂU)

 - imageErrorBuilder : ảnh lỗi (CHƯA TÌM HIỂU)

 



# công việc tiếp theo
 - thiết kế route                      (done)
 - custom api                          (done)
 - custom mobx                         (done)
 - màn hình splash                     (done)
    + dùng Future delay                (done) => Bản sau update lại splash 
 - màn hình screens đang có lỗi        (done)
 - tìm hiểu sliding_clipper_nar_bar    (done)
 - xử lý lỗi agruments                 (done)
 - tiếp tục làm playing
 (https://youtu.be/87d4sQMnf1U?t=396)
 - tìm hiểu ListView.sparated ở dưới


# tìm hiểu thêm
 - CupertinoPageScaffold
 - Divider 
 - ListView.sparated
 - RotationTransition
 - RotationTransition
 - FadeInImage.assetNetwork
 - imageErrorBuilder
 - just_audio_background

# tương lai
 - icon động : Lottie
 - thay đổi : splash screen


