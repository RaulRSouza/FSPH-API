package com.example.squad2_suporte.dto.amostra;

import com.example.squad2_suporte.dto.lote.LoteProtocoloDto;
import com.example.squad2_suporte.enuns.StatusAmostra;
import com.example.squad2_suporte.enuns.TipoAmostra;

public record ProtocoloAmostraDto(
        String protocolo,
        TipoAmostra tipoAmostra,
        StatusAmostra status) {
}