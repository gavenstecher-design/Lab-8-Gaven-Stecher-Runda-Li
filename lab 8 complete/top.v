module top(
    input [15:0] sw,
    input btnL, btnU, btnD, btnR, btnC,
    output [15:0] led
);
    wire [3:0] mux_data;
    wire [1:0] mux_sel = {btnU, btnL};
    wire [1:0] demux_sel = {btnR, btnD};

    mux source_mux(
        .A(sw[3:0]), .B(sw[7:4]),
        .C(sw[11:8]), .D(sw[15:12]),
        .Sel(mux_sel), .Enable(btnC), .Y(mux_data)
    );

    demux destination_demux(
        .In(mux_data), .Sel(demux_sel), .Enable(btnC),
        .Y0(led[3:0]), .Y1(led[7:4]),
        .Y2(led[11:8]), .Y3(led[15:12])
    );
endmodule
