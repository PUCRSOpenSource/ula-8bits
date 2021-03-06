library ieee;
use ieee.std_logic_1164.all;
entity adder8 is
    port
    (      
        op        :in std_logic_vector (1 downto 0); --Operação
        a, b      :in std_logic_vector (7 downto 0);        

        carry_out :out std_logic; --Flag Carry out
        negative  :out std_logic; --Flag Negativo
        zero      :out std_logic; --Flag Zero
        overflow  :out std_logic; --Flag Overflow
        s         :out std_logic_vector (7 downto 0)
    );
end adder8;

architecture adder08 of adder8 is
    signal carry_in:  std_logic; 
    signal c:         std_logic_vector (1 downto 0);
    signal output:    std_logic_vector (7 downto 0);
    signal this_b:    std_logic_vector (7 downto 0);
begin
    with op select
        this_b  <=  "00000001"  when "11", --INC
                    a           when "10", --MULT                    
                    b           when "01", --SUM
                    not b       when others;--SUB
    
    carry_in  <= '1' when op="00" else '0';

    A4: entity work.Adder4
        port map( cin => carry_in , a => a(3 downto 0), b =>this_b(3 downto 0), cout => c(0), s=>output(3 downto 0));
    A5: entity work.Adder4
        port map( cin => c(0) , a => a(7 downto 4), b =>this_b(7 downto 4), cout => c(1), s=>output(7 downto 4));        
		  
    s         <= output;    
    carry_out <= c(1);
    zero      <= not(output(0) or output(1) or output(2) or output(3) or output(4) or output(5) or output(6) or output(7));
    negative  <= output(7)
    overflow  <= (a(7) xor output(7)) and (b(7) xor output(7));
end adder08;
