----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.04.2022 19:09:46
-- Design Name: 
-- Module Name: tb_top_level_operacional - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_top_level_operacional is
--  Port ( );
end tb_top_level_operacional;

architecture Behavioral of tb_top_level_operacional is
    
  component top_level_operacional is
  Port (D_addr : in STD_LOGIC_VECTOR (7 downto 0);
        D_rd : in STD_LOGIC;
        D_wr : in STD_LOGIC; 
        clk: in STD_LOGIC;
        RF_W_data : in STD_LOGIC_VECTOR (7 downto 0);
        RF_s1 : in STD_LOGIC;
        RF_s0 : in STD_LOGIC;
        RF_W_addr : in STD_LOGIC_VECTOR (3 downto 0);
        RF_W_wr : in STD_LOGIC;
        RF_Rp_addr : in STD_LOGIC_VECTOR (3 downto 0);
        RF_Rp_rd : in STD_LOGIC;
        RF_Rq_addr : in STD_LOGIC_VECTOR (3 downto 0);
        RF_Rq_rd : in STD_LOGIC;
        alu_s1 : in STD_LOGIC;
        alu_s0 : in STD_LOGIC;
        RF_Rp_zero : out STD_LOGIC);
  end component;
    
  signal D_addr :  STD_LOGIC_VECTOR (7 downto 0);
  signal D_rd :  STD_LOGIC;
  signal D_wr :  STD_LOGIC; 
  signal clk:  STD_LOGIC := '0';
  signal RF_W_data :  STD_LOGIC_VECTOR (7 downto 0);
  signal RF_s1 :  STD_LOGIC;
  signal RF_s0 :  STD_LOGIC;
  signal RF_W_addr :  STD_LOGIC_VECTOR (3 downto 0);
  signal RF_W_wr :  STD_LOGIC;
  signal RF_Rp_addr :  STD_LOGIC_VECTOR (3 downto 0);
  signal RF_Rp_rd :  STD_LOGIC;
  signal RF_Rq_addr :  STD_LOGIC_VECTOR (3 downto 0);
  signal RF_Rq_rd :  STD_LOGIC;
  signal alu_s1 :  STD_LOGIC;
  signal alu_s0 :  STD_LOGIC;
  signal RF_Rp_zero :  STD_LOGIC;
  constant period: time := 10 ns;
  
begin

    utt:top_level_operacional port map 
       (D_addr => D_addr,
        D_rd => D_rd,
        D_wr => D_wr, 
        clk => clk,
        RF_W_data => RF_W_data,
        RF_s1 => RF_s1,
        RF_s0 => RF_s0,
        RF_W_addr => RF_W_addr,
        RF_W_wr => RF_W_wr,
        RF_Rp_addr => RF_Rp_addr,
        RF_Rp_rd => RF_Rp_rd,
        RF_Rq_addr => RF_Rq_addr,
        RF_Rq_rd => RF_Rq_rd,
        alu_s1 => alu_s1,
        alu_s0 => alu_s0,
        RF_Rp_zero => RF_Rp_zero);
   
   clk <= not clk after period/2;
   stimulus: process
                begin
                -- Carregar constante
                RF_W_data <= "00001000";
                RF_s1 <= '1';
                RF_s0 <= '0';
                RF_W_addr <= "0010";
                RF_W_wr <= '1';
                wait for period;
                -- Armazenar
                D_addr <= "00010001";
                D_wr <= '1';
                RF_Rp_addr <= "0010";
                RF_Rp_rd <= '1';                
                wait for 2*period;
                -- Carregar
                D_wr <= '0';
                D_addr <= "00010001";                
                D_rd <= '1';
                RF_s1 <= '0';
                RF_s0 <= '1';
                RF_W_addr <= "0011";
                RF_W_wr <= '1';
                wait for  2*period;
                -- Somar
                RF_W_wr <= '1';
                RF_s1 <= '0';
                RF_s0 <='0';
                RF_W_addr <= "0100";
                RF_Rp_rd <='1';
                RF_Rq_rd <='1';
                RF_Rp_addr <= "0010";
                RF_Rq_addr <= "0011";
                alu_s1 <= '0';
                alu_s0 <= '1';
                wait for 2*period;
                -- Subtrair
                RF_W_wr <= '1';
                RF_s1 <= '0';
                RF_s0 <='0';
                RF_W_addr <= "0101";
                RF_Rp_rd <='1';
                RF_Rq_rd <='1';
                RF_Rp_addr <= "0010";
                RF_Rq_addr <= "0011";
                alu_s1 <= '1';
                alu_s0 <= '0';
                wait for period;            
                -- Saltar se zero
                RF_Rp_addr <= "0100";
                RF_Rp_rd <= '1';
                wait for period;
                RF_Rp_addr <= "0101";
                RF_Rp_rd <= '1';
             end process;
end Behavioral;
