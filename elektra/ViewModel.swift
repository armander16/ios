//
//  ViewModel.swift
//  elektra
//
//  Created by Armando Maldonado Romo on 27/06/22.
//

import Foundation

final class ViewModel: ObservableObject {

    @Published var lista :Bool = false
    @Published var Productos: Producto = Producto.init(codigo: "", mensaje: "", folio: "", advertencia: "", resultado: Resultado.init(paginacion: Paginacion.init(), categoria: "", productos: []))
    func RestApi() async throws {
        
        var base = "http://alb-dev-ekt-875108740.us-east-1.elb.amazonaws.com/sapp/productos/plp/1/ad2fdd4bbaec4d15aa610a884f02c91a"
        
        let urlSession = URLSession.shared
    
     
   
        
        var request = URLRequest(url: URL(string: base)!,timeoutInterval: Double.infinity)
     //   request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        do{
            let (data, response) = try await URLSession.shared.data(for: request)
           guard let respuesta = response as? HTTPURLResponse, respuesta.statusCode == 200 else {
                  let Productos = try! JSONDecoder().decode(Error.self, from: data)
               DispatchQueue.main.async {
                   
                   print ("Error")
               
               }
               return  // fatalError("Error while fetching data")
           }
               let Productos = try!  JSONDecoder().decode(Producto.self, from: data)
           print("datos: \(Productos)")
            DispatchQueue.main.async {
                self.Productos = Productos
                self.lista = true

            }
        }
        catch{
            return
        }
        

    }
}
