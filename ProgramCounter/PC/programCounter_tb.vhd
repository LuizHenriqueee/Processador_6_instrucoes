----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/06/2022 11:00:29 AM
-- Design Name: 
-- Module Name: programCounter_tb - Behavioral
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

entity programCounter_tb is
--  Port ( );
end programCounter_tb;

architecture Behavioral of programCounter_tb is


component programCounter is
    Port ( clk : in STD_LOGIC;
           PC_Id : in STD_LOGIC;
           PC_clr : in STD_LOGIC;
           PC_inc : in STD_LOGIC;
           PC_in : in STD_LOGIC_VECTOR (15 downto 0);
           PC : out STD_LOGIC_VECTOR (15 downto 0));
end component;


   signal clk     :  STD_LOGIC;
   signal PC_Id   :  STD_LOGIC;
   signal PC_clr   :  STD_LOGIC;
   signal PC_inc   :  STD_LOGIC;
   signal PC_in    :  STD_LOGIC_VECTOR (15 downto 0);
   signal PC       :  STD_LOGIC_VECTOR (15 downto 0);


begin

    PC_MAP: programCounter port map (clk, PC_Id, PC_clr, PC_inc, PC_in, PC);
    
    clk_stim: process
    begin
    clk <= '0';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
    end process;
    
    
    pc_stim: process
    begin 
        PC_clr <='1';
        PC_Id <= '0';
        PC_inc <= '0';
        PC_in <= X"0000";
        wait for 10 ns;
        PC_clr <= '0';
        PC_inc <= '1';
        wait for 100 ns;
        PC_in <= X"0001";
        PC_inc <= '0';
        PC_Id <= '1';
        wait for 10 ns;
        PC_Id <= '0';
        wait for 10 ns;
        PC_inc <= '1';
        wait for 100 ns;
        
    
    
    end process;


end Behavioral;
