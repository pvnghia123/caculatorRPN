# giải thích cú pháp ba lan ngược
    khi đọc 1 biểu thức sẽ có 2 phần là toán tử và toán hạng
    toán tử là có phép toán : +(cộng),-(trừ),*(nhân),/(chia),()(ngoặc tròn),.(chấm),....
    tóan hạng là các số trong phép toán: 1,2,3,4,5,6...
    kí pháp ba lan ngược sẽ hoạt động như sau:
    - tính toán độ ưu tiên của toán tử: cao nhất là ()(ngoặc), tiếp đến là /(chia),*(nhân), sau cùng là +(cộng),-(trừ)
    - ở đây có sử dụng 2 array(stack) là arrayOperation(mảng các toán tử),arrayMath(mảng kết quả sau cùng)
    - Duyện biểu thức :
        - nếu là toán tử thì thêm vào arrayMath
        - nếu là toán hạng thì
            - toán hạng '(': thêm vào arrayOperation
            - toán hạng ')': lấy từ cuối về đầu của arrayOperation thêm vào arrayMath.TH gặp ')' thì dừng lại và xóa'(' khỏi arrayOperation
            - nếu là '/','*','+','-': lấy phần tử cuối của arrayOperation ra để so sanh
                - phân tử cuối = nil or '(' thêm vào arrayOperation
                - phần tử cuối arrayOperation >= toán tử hiện tại thi thêm toán tử cuối vào arrmath, thêm toán tử hiện tại vào arrayOperation
                - nhỏ hơn thì thêm vào arrayOperation
    - tính toán :
        - duyệt biểu thức ba la ngược,
            - nếu gặp toán hạng add vào stack(mảng)
            - nếu gặp toán tử thì lấy 2 phần tử cuối của stack(mảng) rồi tính toán theo toán tử và thêm kết quả vừa tính vào stack(mảng).
    
