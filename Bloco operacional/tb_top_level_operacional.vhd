-- Testebench do bloco operacional:
-- Simula as 6 operações do processador:
-- 1. Carrega uma constante no registrador 2
-- 2. Armazenar na posição 17 da memoria D
-- 3. Carrega da no registrador 3 a posição 17 da memoria D
-- 4. Faz operação de soma com o registrador 2 e 3 e armazena no registrador 4
-- 5. Faz operação de subtração com o registrador 2 e 3 e
-- armazena no registrador 5
-- 7. Salta se registrador 4 for 0, o que é esperado que não salte
-- 8. Salta se registrador 5 for 0, e o sinal RF_Rp_zero vai para nível lógico
-- alto

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

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
                wait for period/2;
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
                RF_W_wr <= '0';
                RF_Rp_addr <= "0010";
                RF_Rp_rd <= '1';
                wait for period;
                -- Carregar
                RF_W_data <= "00001000";
                D_wr <= '0';
                D_addr <= "00010001";
                D_rd <= '1';
                RF_s1 <= '1';
                RF_s0 <= '0';
                RF_W_addr <= "0011";
                RF_W_wr <= '1';
                wait for  period;
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
                wait for period;
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
                RF_Rp_addr <= "0101";
                RF_Rp_rd <= '1';
                wait for period/2;
             end process;
end Behavioral;
