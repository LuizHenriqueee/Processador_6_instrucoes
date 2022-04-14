library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
use STD.textio.ALL; --Biblioteca para manipulacao de arquivos de texto.

entity memoryI is
    Port ( addr : in STD_LOGIC_VECTOR (15 downto 0);
           rd : in STD_LOGIC;
           data : out STD_LOGIC_VECTOR (15 downto 0));
end memoryI;

architecture Behavioral of memoryI is

	--Declaração do formato de memória que será utilizado.
    type memI_type is array (2**16 - 1 downto 0) of STD_LOGIC_VECTOR (15 downto 0);
    signal memI : memI_type;
    

begin

    mem_init:process
        file hex_File: text open read_mode is "hexFile.mem";
        variable index: integer;
        variable data_line : line;
        variable hex_val: integer;
        variable char: character;
        
        begin
        --Memória é inicializada com todos os valores em 0
        for i in 0 to 65535 loop
            memI(i) <= X"0000";
        end loop;
        
        index:=0;
       	-- Carrega todos os valores do arquivo na memória I. 
        while not endfile(hex_file) loop
            readline(hex_file, data_line);  
	    hex_val:=0;
	    -- A cada loop,uma localização da memória é preenchida com uma linha
            for k in 0 to 3 loop
		    --Realiza a conversão utilizando a tabela ASCII.
                    read(data_line, char);
                    if char <= '9' and char >= '0' then
                        hex_val := hex_val*(16) + character'pos(char) - character'pos('0');
                    elsif char >= 'a' and char <= 'f' then
                        hex_val := hex_val*(16) + character'pos(char) - character'pos('a')+10;
                    elsif char>='A' and char <= 'F' then 
                        hex_val := hex_val*(16) + character'pos(char) - character'pos('A')+10;
                    end if;
            end loop;
	    --Armazena o valor na memória como tipo STD_LOGIC_VECTOR.
            memI(index) <= STD_LOGIC_VECTOR(TO_UNSIGNED(hex_val, data'length));

            index := index + 1;
        end loop;
        wait;        
        end process;
       --Memória assíncrona, então só irá mudar o dado quando rd='1' e quando
       -- mudar o valor do endereço.	
     data_out:process(rd,addr)
     begin
        if rd='1' then 
        data <= memI(CONV_INTEGER(addr));
        end if;
     end process;
     
end Behavioral;
