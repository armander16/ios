//
//  ContentView.swift
//  elektra
//
//  Created by Armando Maldonado Romo on 27/06/22.
//

import SwiftUI

struct ContentView: View {


    var body: some View {
        
        InicioView()
    
    }
}


struct InicioView: View {

    @StateObject  var apiservice: ViewModel = ViewModel()
    @State var lista = false
    @State var detalle: ProductoElement = ProductoElement.init(id: "", idLinea: 0, codigoCategoria: "", idModalidad: 0, relevancia: 0, lineaCredito: "", pagoSemanalPrincipal: 0, plazoPrincipal: 0, disponibleCredito: false, abonosSemanales: [AbonosSemanale.init()], sku: "", nombre: "", urlImagenes: [], precioRegular: 0.0, precioFinal: 0.0, porcentajeDescuento: 0.0, descuento: false, precioCredito: 0.0, montoDescuento: 0.0)
    var body: some View {
        
        VStack(){
            
            Text(detalle.nombre)
                .multilineTextAlignment(.leading)
                .font(.system(size: 20))
                .foregroundColor(.black)
            
                .foregroundColor(.black)
            
            Text("$\(detalle.precioFinal)")
                .font(.system(size: 13))

                Button("Productos") {
                    
                    Task {
                            do {
                                try await apiservice.RestApi()
                                lista.toggle()


                                    
                            } catch {
                                    print("Error", error)
                            }
                    }
                }
                .fullScreenCover(isPresented: $lista) {
                    ListaView(  Lista: $lista ,Datos: apiservice.Productos, Detalle: $detalle)
                }
            
        }
   
    
    }
}
struct ListaView: View {
    @Binding var Lista : Bool
    @State var Datos : Producto
    @Binding var Detalle : ProductoElement
    @StateObject  var apiservice: ViewModel = ViewModel()

    var body: some View {
        
        VStack(){
            Text("lista")
               
            ScrollView       {
            ForEach(Datos.resultado.productos, id: \.self) { productos in

                Button(
                    action: {
                        Lista.toggle()
                        Detalle = productos
                    }, label: {
                        CardView(datos: productos)
                    })
                }
            }
        }
 
        
    }
}


struct CardView: View {
    @State var datos: ProductoElement = ProductoElement.init(id: "", idLinea: 0, codigoCategoria: "", idModalidad: 0, relevancia: 0, lineaCredito: "", pagoSemanalPrincipal: 0, plazoPrincipal: 0, disponibleCredito: false, abonosSemanales: [AbonosSemanale.init()], sku: "", nombre: "", urlImagenes: [], precioRegular: 0.0, precioFinal: 0.0, porcentajeDescuento: 0.0, descuento: false, precioCredito: 0.0, montoDescuento: 0.0)
    var body: some View {
        ZStack {
            HStack{
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(stops: [
                                Gradient.Stop(color: .yellow, location: 0.02),
                                Gradient.Stop(color: .white, location: 0.02)
                            ]),
                            startPoint: .leading,
                            endPoint: .trailing))
                    .frame(width: (UIScreen.main.bounds.width / 10) * 8, height: 120).padding()
            }
            VStack (alignment :.leading) {
                
               /* AsyncImage(url: URL(string: datos.urlImagenes[0]))
                               .frame(width:50, height:50) */
                HStack(){
                    AsyncImage(
                               url: URL(string: datos.urlImagenes[0]),
                               content: { image in
                                   image.resizable()
                                       .frame(width: 80, height: 50)
                               },
                               placeholder: {
                                   ProgressView()
                               }
                           )
                    Text(datos.nombre)
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 500))
                        .minimumScaleFactor(0.01)
                        .foregroundColor(.black)
                        .foregroundColor(.black)
                }
             
              
                HStack{
                    Text("$\(datos.precioFinal)")
                        .font(.system(size: 13))

                    Text("Categoria:\(datos.codigoCategoria)")
                        .font(.system(size: 13))
                            .foregroundColor(.black)
                  
                    Spacer()
                  
                }
            }
            .padding(30)
            .multilineTextAlignment(.center)
        }
        .frame(width: (UIScreen.main.bounds.width / 10) * 8, height: 120)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

