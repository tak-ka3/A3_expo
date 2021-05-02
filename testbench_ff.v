module testbench_fli;

    parameter CYCLE = 10; // 1サイクルが10ユニットという意味
    parameter HALF_CYCLE = 5;
    parameter DLY = 5;

    reg CK, RB; //値を保持する必要があるもの
    wire D;

    flipflop_not flipflop_not_0(
    .CK(CK),
    .RB(RB)
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
initial begin
    #10
    RB=1'b0;

    #1000
    $finish;
end

endmodule
