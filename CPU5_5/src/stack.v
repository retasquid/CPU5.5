module stack(
    output reg [15:0] Dout,
    output reg [15:0] ADDRout,
    input wire [15:0] ADDRin,
    input wire CallINT,
    input wire Call,
    input wire Ret,
    input wire CLK,
    input wire RST
);
    
    always@(*) begin
		if(CallINT===1'b1)begin
			Dout<=ADDRin;
		end else begin
			Dout<=ADDRin + 16'b1;
		end
    end

    initial begin
        ADDRout <= 16'b0000000011110111;
    end

    always@(negedge CLK or posedge RST) begin
        if(RST) begin
            ADDRout <=16'b0000000011110111;
        end else begin
            if(Call) begin
                ADDRout <= ADDRout - 16'b1;
            end
            if(Ret) begin
                ADDRout <= ADDRout + 16'b1;
            end
        end
    end
endmodule