//
//  modelo.swift
//  elektra
//
//  Created by Armando Maldonado Romo on 27/06/22.
//

import Foundation


struct Error: Codable {
    let mensaje: String
}


struct Producto: Decodable {
    let codigo, mensaje, folio, advertencia: String
    let resultado: Resultado
    
    init(
        codigo: String = "",
        mensaje: String = "",
        folio: String = "",
        advertencia: String = "",
        resultado: Resultado
        )
    
    {
        
        self.codigo = codigo
        self.mensaje = mensaje
        self.folio = folio
        self.advertencia = advertencia
        self.resultado = resultado
        
    }
    
    enum CodingKeys: String, CodingKey {
        case codigo, mensaje, folio, advertencia, resultado

    }
}

struct Resultado: Decodable {
    let paginacion: Paginacion
    let categoria: String
    let productos: [ProductoElement]
    
    init(

        paginacion: Paginacion,
        categoria: String = "",
        productos: [ProductoElement]
        )
    
    {
        
        self.paginacion = paginacion
        self.categoria = categoria
        self.productos = productos
    
        
    }
    
    enum CodingKeys: String, CodingKey {
        case paginacion, categoria, productos

    }
}

struct Paginacion: Decodable {
    let pagina, totalPaginas, totalRegistros, totalRegistrosPorPagina: Int
    
    
    init(

        pagina: Int = 0,
        totalPaginas: Int = 0,
        totalRegistros: Int = 0,
        totalRegistrosPorPagina: Int = 0
        )
    
    {
        
        self.pagina = pagina
        self.totalPaginas = totalPaginas
        self.totalRegistros = totalRegistros
        self.totalRegistrosPorPagina = totalRegistrosPorPagina
    
        
    }
    
    enum CodingKeys: String, CodingKey {
        case pagina, totalPaginas, totalRegistros, totalRegistrosPorPagina

    }
}

struct ProductoElement: Decodable , Hashable {
    let id: String
    let idLinea: Int
    let codigoCategoria: String
    let idModalidad, relevancia: Int
    let lineaCredito: String
    let pagoSemanalPrincipal, plazoPrincipal: Int
    let disponibleCredito: Bool
    let abonosSemanales: [AbonosSemanale]
    let sku, nombre: String
    let urlImagenes: [String]
    let precioRegular, precioFinal: Double
    let porcentajeDescuento: Double
    let descuento: Bool
    let precioCredito, montoDescuento: Double
    
    
    init(
        id: String = "",
        idLinea: Int = 0,
        codigoCategoria : String = "",
        idModalidad: Int = 0,
        relevancia: Int = 0,
        lineaCredito: String = "",
        pagoSemanalPrincipal: Int = 0,
        plazoPrincipal: Int = 0,
        disponibleCredito: Bool = false,
        abonosSemanales:[AbonosSemanale],
        sku: String = "",
        nombre: String = "",
        urlImagenes : [String],
        precioRegular: Double = 0.0,
        precioFinal: Double = 0.0,
        porcentajeDescuento: Double = 0.0,
        descuento: Bool = false,
        precioCredito: Double = 0.0,
        montoDescuento: Double = 0.0
        )
    
    {
        
        self.id = id
        self.idLinea = idLinea
        self.codigoCategoria = codigoCategoria
        self.idModalidad = idModalidad
        self.relevancia = relevancia
        self.lineaCredito = lineaCredito
        self.pagoSemanalPrincipal = pagoSemanalPrincipal
        self.plazoPrincipal = plazoPrincipal
        self.disponibleCredito = disponibleCredito
        self.abonosSemanales = abonosSemanales
        self.sku = sku
        self.nombre = nombre
        self.urlImagenes = urlImagenes
        self.precioRegular = precioRegular
        self.precioFinal = precioFinal
        self.porcentajeDescuento = porcentajeDescuento
        self.descuento = descuento
        self.precioCredito = precioCredito
        self.montoDescuento = montoDescuento

        
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case idLinea, codigoCategoria, idModalidad, relevancia, lineaCredito
        case pagoSemanalPrincipal, plazoPrincipal, disponibleCredito, abonosSemanales
        
        case sku
        case nombre, urlImagenes, precioRegular, precioFinal, porcentajeDescuento
        case descuento, precioCredito, montoDescuento
    
    

    }
}

struct AbonosSemanale: Decodable , Hashable{
    let plazo, montoAbono, montoDescuentoAbono, montoUltimoAbono: Int
    let montoFinalCredito, idPromocion, montoDescuentoElektra, montoDescuentoBanco: Int
    let precio, montoAbonoDigital: Int
    
    init(
        plazo: Int = 0,
        montoAbono: Int = 0,
        montoDescuentoAbono : Int = 0,
        montoUltimoAbono: Int = 0,
        montoFinalCredito: Int = 0,
        idPromocion: Int = 0,
        montoDescuentoElektra: Int = 0,
        montoDescuentoBanco: Int = 0,
        precio: Int = 0,
        montoAbonoDigital: Int = 0
    )
    
    {
        
        self.plazo = plazo
        self.montoAbono = montoAbono
        self.montoDescuentoAbono = montoDescuentoAbono
        self.montoUltimoAbono = montoUltimoAbono
        self.montoFinalCredito = montoFinalCredito
        self.idPromocion = idPromocion
        self.montoDescuentoElektra = montoDescuentoElektra
        self.montoDescuentoBanco = montoDescuentoBanco
        self.precio = precio
        self.montoAbonoDigital = montoAbonoDigital

        
    }
    
    enum CodingKeys: String, CodingKey {
        case plazo
        case montoAbono, montoDescuentoAbono, montoUltimoAbono, montoFinalCredito, idPromocion
        case montoDescuentoElektra, montoDescuentoBanco, precio, montoAbonoDigital
    

    }
}
