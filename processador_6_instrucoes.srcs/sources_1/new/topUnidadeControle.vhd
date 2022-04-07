----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/07/2022 04:32:35 PM
-- Design Name: 
-- Module Name: topUnidadeControle - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity topUnidadeControle_tb is
--  Port ( );
end topUnidadeControle_tb;



architecture Behavioral of topUnidadeControle_tb is


component unidade_de_controle is -- top-level design for testing

	port(	clk, reset: in STD_LOGIC;
			data: in STD_LOGIC_VECTOR(15 downto 0);
			RF_Rp_zero: in STD_LOGIC;
			PC: out STD_LOGIC_VECTOR(15 downto 0);
			I_rd: out STD_LOGIC;
			D_addr, RF_W_data: out STD_LOGIC_VECTOR(7 downto 0);
			RF_W_addr, RF_Rp_addr, RF_Rq_addr: out STD_LOGIC_VECTOR(3 downto 0);
			D_rd, D_wr, RF_s1, RF_s0, RF_W_wr, RF_Rp_rd, RF_Rq_rd, alu_s1, alu_s0 : out STD_LOGIC);

end component;
            signal clk, reset:  STD_LOGIC;
			signal data:  STD_LOGIC_VECTOR(15 downto 0);
			signal RF_Rp_zero:  STD_LOGIC;
			signal PC:  STD_LOGIC_VECTOR(15 downto 0);
			signal I_rd:  STD_LOGIC;
			signal D_addr, RF_W_data:  STD_LOGIC_VECTOR(7 downto 0);
			signal RF_W_addr, RF_Rp_addr, RF_Rq_addr:  STD_LOGIC_VECTOR(3 downto 0);
			signal D_rd, D_wr, RF_s1, RF_s0, RF_W_wr, RF_Rp_rd, RF_Rq_rd, alu_s1, alu_s0 :  STD_LOGIC;


begin

    control_unit: unidade_de_controle port map (clk, reset,
    data,
    RF_Rp_zero,
    PC,
    I_rd,
    D_addr, RF_W_data,
    RF_W_addr, RF_Rp_addr, RF_Rq_addr,
    D_rd, D_wr, RF_s1, RF_s0, RF_W_wr, RF_Rp_rd, RF_Rq_rd, alu_s1, alu_s0
    );
    
    
    clk_stim: process
    begin
        clk <= '0';
        wait for 5 ns;
        clk <= '1';
        wait for 5 ns;
    end process;
    
    stimulus: process
    begin
        data <= B"0000000100000001";
        RF_RP_zero <= '0';
        wait for 30 ns; 
        data <= B"0001111100000001";
        wait for 30 ns;
        data <= B"0010000000010010";
        wait for 30 ns;
        data <= B"0011000000010010";
        wait for 10 ns;
        data <= B"0000000000000000";
        wait for 30 ns;
        data<=  B"0100000000010010";
        wait for 30 ns;
        data <= B"0101000100000101";
        RF_Rp_zero <= '1';
        wait for 30 ns;
        
    end process;

end Behavioral;
