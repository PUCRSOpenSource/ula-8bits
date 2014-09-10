library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity TB is
    end TB;
architecture TB of TB is
    signal a, b, output: std_logic_vector(7 downto 0);
    signal op :          std_logic_vector(2 downto 0);
    signal carry_out:    std_logic;
    signal negative:     std_logic;
    signal zero:         std_logic;
    signal overflow:     std_logic;
    signal arithmetic    std_logic_vector(7 downto 0);
    signal logic         std_logic_vector(7 downto 0)
begin
    arthm: entity work.Adder8    
           port map(op => op,                
                    a  => a,                          
                    b  => b, 
                    carry_out => carry_out, 
                    negative  => negative, 
                    zero      => zero,
                    overflow  => overflow,
                    s         => arithmetic
                   );
    logc: entity work.Logic8
          port map( a  => a,
                    b  => b,
                    op => op,
                    s  => logic
                  );
    mux: entity work.Mux
         port map(op => op(2),
                  arithmetic => arithmetic,
                  logic      => logic,
                  output     => output
              );
          
    a   <="00000", "11001" after 10ns, "00100"after 30ns;
    b   <="00000", "10100" after 10ns;
    op  <="000", "001" after 20ns, "010" after 30ns, "011" after 40ns,
              "100" after 50ns, "101" after 60ns, "110" after 70ns, "111" after 80ns;
    
end tb;
