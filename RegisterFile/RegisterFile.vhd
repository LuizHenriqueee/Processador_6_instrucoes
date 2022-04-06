----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/06/2022 01:32:15 PM
-- Design Name: 
-- Module Name: RegisterFile - behavorial
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RegisterFile is
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
end RegisterFile;

architecture behavorial of RegisterFile is

    type registerFile is array(15 downto 0) of STD_LOGIC_VECTOR(15 downto 0);
    signal RF : registerFile; 
    
    
begin

    mem_wr: process(clk)
    begin
        if(W_wr = '1') then
            RF(CONV_INTEGER(W_addr)) <= W_data;
        end if;
    end process;

    mem_up: process(Rp_rd, Rq_rd)
    begin 
    
        if(Rp_rd = '1') then
            Rp_data <= RF(CONV_INTEGER(Rp_addr));
        end if;
        if(Rq_rd = '1') then
            Rq_data <= RF(CONV_INTEGER(Rq_addr));
        end if;
 
    
    end process;


end behavorial;
