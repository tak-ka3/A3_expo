module testbench_fli;

    parameter CYCLE = 30; // 1サイクルが10ユニットという意味
    parameter HALF_CYCLE = 15;
    parameter DLY = 15;

    reg CK, RB; //値を保持する必要があるもの
    wire Q;
    wire D;

    flipflop_not flipflop_not_0(
    .D(D),
    .CK(CK),
    .RB(RB),
    .Q(Q)
);

// 下は常に繰り返すという意味
// ここではクロックの作成をしている
always begin
    CK=1'b1; // まずクロックを１にする
    #(HALF_CYCLE)CK = 1'b0; // 半周期遅延させた後、クロックを０にする
    #(HALF_CYCLE); // その後半周期遅延させる
end

// initialはプログラム開始後に一度だけ実行する、入力を表すもの
// 今回は１０ユニットだけ遅延させた後、１０００ユニット実行する
integer i;
initial begin
//    D<=1'b0;
    RB<=1'b1;
    #5
    RB=1'b0;
    #46
    RB<=1'b1;
    #5
    RB=1'b0;
    #46
    
    #1000
    $finish;
end

endmodule

