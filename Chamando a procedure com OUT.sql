create or replace PROCEDURE INCLUIR_CLIENTE
    (p_id in cliente.id%type,
     p_razao_social in cliente.razao_social%type,
     p_CNPj cliente.CNPJ%type,
     p_segmercado_id in cliente.segmercado_id%type,
     p_faturamento_previsto in cliente.faturamento_previsto%type)
IS
    v_categoria cliente.categoria%type;
    v_cnpj cliente.cnpj%type := p_cnpj;
BEGIN

    v_categoria := categoria_cliente (p_faturamento_previsto);
    
    FORMAT_CNPJ(v_CNPJ);
    
    INSERT INTO cliente
        VALUES (p_id, upper(p_razao_social), v_CNPJ, p_segmercado_id,
                SYSDATE, p_faturamento_previsto, v_categoria);
    COMMIT;
END;

na principal executar a procedure

EXECUTE INCLUIR_CLIENTE(3, 'Industria RTY', '12378', NULL, 110000)


select * from cliente