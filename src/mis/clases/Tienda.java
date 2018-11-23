/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mis.clases;

import conexionBD.Conectar;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Random;
import javax.swing.JOptionPane;
import mis.clases.cola.ArrayCola;

/**
 *
 * @author Wilder
 */
public class Tienda {
    
    private int codSucursal;
    private String distrito;
    public Conectar conectar;
    
    private CajaDePago []cajas;
    private final int TAM_CAJAS = 10;
    public static float montoTotalRecaudado=0.0f;

    //Constructor con parámetro (código de sucursal, distrito) aquí el arreglo se crea vacío.
    public Tienda(int codSucursal, String distrito) {
        this.codSucursal = codSucursal;
        this.distrito = distrito;
        this.cajas = new CajaDePago[TAM_CAJAS];
        this.conectar = new Conectar();
    }

    public int getCodSucursal() {
        return codSucursal;
    }

    public String getDistrito() {
        return distrito;
    }

    public CajaDePago[] getCajas() {
        return cajas;
    }

    public void setCodSucursal(int codSucursal) {
        this.codSucursal = codSucursal;
    }

    public void setDistrito(String distrito) {
        this.distrito = distrito;
    }
    
    
    
    
    
    // Método que seleccione aleatoriamente una caja e inserte un nuevo cliente a la cola,
    // en caso la caja no este habilitado debe crearla para insertar al cliente en la cola.
    
    public int insertarClienteACaja(Cliente c){
        Random ran = new Random();
        int caja = -1;
        boolean insertado = false;
        //Quiero validar el caso en que la caja este llena de clientes, y el caso en que todas las cajas esten llenas
        
        boolean todoLleno = true;
        
        for (int i = 0; i < this.TAM_CAJAS; i++) {
            if(this.cajas[i]== null || !this.cajas[i].colaDeClientes().colaLlena()){
                todoLleno = false;
                break;
            }
        }
        
        if(!todoLleno){
            while(!insertado){
                int num = ran.nextInt(TAM_CAJAS);
                if(cajas[num]==null){
                    CajaDePago nuevaCaja = new CajaDePago();
                    cajas[num]= nuevaCaja;
                    caja = num;
                    Connection reg=conectar.conexion();       
                    String sql;

                    sql="insert into cajadepago(cod_sucursal,num_de_caja,monto_recaudado) Values (?,?,?)";
                     try {
                         PreparedStatement pst=reg.prepareStatement(sql);
                         pst.setInt(1, getCodSucursal());
                         pst.setInt(2, num);
                         pst.setFloat(3, montoTotalRecaudado);
                         int n=pst.executeUpdate();
                         if(n!=0){
                             JOptionPane.showMessageDialog(null, "Valores cargados .......");
                         }
                                   
                     } catch (SQLException e) {
                         System.out.println("Error encontrado  "+e.toString());
                     }
                }
                if(!cajas[num].getClientes().colaLlena()){
                    cajas[num].agregarCliente(c);
                    insertado = true;
                    JOptionPane.showMessageDialog(null, "cliente fue insertado en la caja "+(num+1));
                }
            }
        }else{
            JOptionPane.showMessageDialog(null, "no se pudo insertar al cliente porque todas las cajas estan llenas");
        }
        
        return caja;
    }
        
    //--------------------------------------------------------------------------------------------------        
    public String toString(){
        String dato ="Codigo de sucursal:"+this.codSucursal+"\n"
                + "Distrito: "+this.distrito+"\n"
                + "Los cajeros:"+"\n";
        
        for (int i = 0; i < this.TAM_CAJAS; i++) {
            
            if(this.cajas[i] != null && !this.cajas[i].getClientes().colaVacia()){
                dato = dato+"\t La caja No "+(i+1)+": "+"\n";
                
                ArrayCola<Cliente> cli = this.cajas[i].colaDeClientes();
                Cliente c;
                while(!cli.colaVacia()){
                    c = cli.desencolar();
                    dato = dato+ c.toString()+"\n";
                }
            }
            
        }
        
        dato += "\t\t---";
        
        return dato;
    }
        
        
    
    //es una funcion de tienda para saber si la caja está habilitada por el numero de caja
    public boolean cajaHabilitado(int numDeCaja){
        boolean estado=true;
        if(this.cajas[numDeCaja]==null){
            estado=false;
        }
        return estado;
    }
    
    
    
    
}
