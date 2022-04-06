----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/06/2022 01:48:29 PM
-- Design Name: 
-- Module Name: RegisterFile_tb - Behavioral
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

entity RegisterFile_tb is
--  Port ( );
end RegisterFile_tb;

architecture Behavioral of RegisterFile_tb is

component RegisterFile is
    Port ( clk : in STD_LOGIC;
           W_data : in STD_LOGIC_VECTOR (15 downto 0);
           W_addr : in STD_LOGIC_VECTOR (3 downto 0);
           W_wr : in STD_LOGIC;
           Rp_addr : in STD_LOGIC_VECTOR (3 downto 0);
           Rp_rd : in STD_LOGIC;
           Rq_addr : in STD_LOGIC_VECTOR (3 downto 0);
           Rq_rd : in STD_LOGIC;
           Rp_data : out STD_LOGIC_VECTOR (15 downto 0);
           Rq_data : out STD_LOGIC_VECTOR (15 downto 0));
end component;


    signal clk      : STD_LOGIC;
    signal W_data   : STD_LOGIC_VECTOR (15 downto 0);
    signal W_addr   : STD_LOGIC_VECTOR (3 downto 0);
    signal W_wr     : STD_LOGIC;
    signal Rp_addr  : STD_LOGIC_VECTOR (3 downto 0);
    signal Rp_rd    : STD_LOGIC;
    signal Rq_addr  : STD_LOGIC_VECTOR (3 downto 0);
    signal Rq_rd    : STD_LOGIC;
    signal Rp_data  : STD_LOGIC_VECTOR (15 downto 0);
    signal Rq_data  : STD_LOGIC_VECTOR (15 downto 0);


begin
    
    pm_rf: RegisterFile port map(clk, W_data, W_addr, W_wr, Rp_addr, Rp_rd, Rq_addr, Rq_rd, Rp_data, Rq_data); 
    
    clk_stim: process
    begin 
    clk<='0';
    wait for 5 ns;
    clk <= '1';
    wait for 5ns;
    end process;
    
    rf_test: process 
    begin
    
    W_data <= X"00FF";
    W_addr <= X"0";
    W_wr <= '1';
    Rp_addr<= X"0";
    Rp_addr<= X"0";
    Rp_rd <= '0';
    Rq_rd <= '0';
    
    wait for 10 ns;
    
    W_data <= X"00AA";
    W_addr <= X"F";

    
    wait for 10 ns;
    
    W_data <= X"00BB";
    W_addr <= X"0";
    W_wr <= '0';
    Rp_addr <= X"0";
    Rp_rd <= '1';
    Rq_addr <= X"F";
    Rq_rd <= '1';
    
    wait for 10 ns;
    
    
    end process;

end Behavioral;
