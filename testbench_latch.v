// このファイルのモジュールの名前
module test_Latch;

    parameter CYCLE = 100;
    parameter HALF_CYCLE = 50;
    parameter DLY = 50;

    reg CK;
    reg D;
    wire Q;
    // ここでモジュールを使って素子を形成
    Latch Latch_0(
    .CK(CK),
    .D(D),
    .Q(Q)
);

    always begin
      CK=1'b1;
      #(HALF_CYCLE)CK = 1'b0;
      #(HALF_CYCLE);
    end

    initial begin
	D=1'b0;
	#40
	D=1'b1;
	#40
	D=1'b0;
	#40
	D=1'b1;

	repeat(10)@(CK); // クロックが１０回立ち上がった後に下に進める
	// クロックがどう立ち上がるかはalways beginで示されている
	# 1000
	$finish;// 全体として1000遅延で終わるという意味
    end
endmodule
