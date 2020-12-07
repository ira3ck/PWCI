drop database pokecenter;

create database pokecenter;
use pokecenter;
CREATE TABLE USUARIO (
	nombre				varchar(50),
    apellidoPaterno		varchar(50),
    apellidoMaterno		varchar(50),
    telefono			varchar(15) NOT NULL,
    correo				varchar(255) NOT NULL,
    usuario				varchar(50) NOT NULL,
    contraseña			varchar(30) NOT NULL,
    imagen				longblob,
    genero				set('Hombre','Mujer','No Binario'),
    Fecha_nacimiento	date,
    estado				char,
    CONSTRAINT PK_Usuario PRIMARY KEY (usuario)
);

DROP TABLE IF EXISTS Listas;
CREATE TABLE Listas (
	clave			int unsigned auto_increment,
    usuarioFK		varchar(50),
    nombre			varchar(20),
    descripción		varchar(100),
    imagen			longblob,
    public			char,
	CONSTRAINT PK_Listas PRIMARY KEY (clave),
	CONSTRAINT FK_usuarioXlistas FOREIGN KEY (usuarioFK)
		REFERENCES Usuario (usuario)
);

DROP TABLE IF EXISTS Sección;
CREATE TABLE Sección (
    clave	int unsigned auto_increment,
    nombre	varchar(255),
    CONSTRAINT PK_Sección PRIMARY KEY (clave)
);

DROP TABLE IF EXISTS Objetos;
CREATE TABLE Objetos (
	clave			int unsigned auto_increment,
    nombre			varchar(50),
    descripción		text,
    precio			float,
    secciónFK		int unsigned,
    CONSTRAINT PK_Objeto PRIMARY KEY (clave),
	CONSTRAINT FK_secciónXlistas FOREIGN KEY (secciónFK)
		REFERENCES Sección (clave)
);

DROP TABLE IF EXISTS listaXobjeto;
CREATE TABLE listaXobjeto(
    clave		int unsigned auto_increment,
    listaFK		int unsigned,
    objetoFK	int unsigned,
    CONSTRAINT PK_listaXobjeto PRIMARY KEY (clave),
	CONSTRAINT FK_listaXlistaXobjeto FOREIGN KEY (listaFK)
		REFERENCES Listas (clave),
	CONSTRAINT FK_secciónXlistaXobjeto FOREIGN KEY (objetoFK)
		REFERENCES Objetos (clave)
);

DROP TABLE IF EXISTS Carrito;
CREATE TABLE Carrito (
	id					int unsigned auto_increment not null,
    UsuarioFK 			varchar(50) not null,
    ObjetoFK			int unsigned,	
    Cantidad			int,
	CONSTRAINT PK_Carrito PRIMARY KEY (id),
	CONSTRAINT FK_carritoXusuario FOREIGN KEY (UsuarioFK)
		REFERENCES USUARIO(usuario),
	CONSTRAINT FK_CarritoXObjeto FOREIGN KEY (ObjetoFK)
		REFERENCES Objetos(clave)
);

DROP TABLE IF EXISTS Comentario;
CREATE TABLE Comentario (
	clave int unsigned auto_increment not null,
	texto text,
	fecha date,
	respondeA_FK int unsigned,
	objetoFK int unsigned,
	usuarioFK varchar(50),
    
    CONSTRAINT PK_Comentarios PRIMARY KEY (clave),
	CONSTRAINT FK_ComXComentarios FOREIGN KEY (respondeA_FK)
		REFERENCES Comentario(clave),
	CONSTRAINT FK_ObjXComentarios FOREIGN KEY (objetoFK)
		REFERENCES Objetos(clave),
	CONSTRAINT FK_UserXComentarios FOREIGN KEY (usuarioFK)
		REFERENCES USUARIO(usuario)
);

DROP TABLE IF EXISTS Historial;
CREATE TABLE Historial(
	id							int unsigned auto_increment not null,
    Fecha						date,
    NumeroDeCompra				int not null,
	NombreObj					varchar(100),	
    DescripciónObj				varchar(255),
    PrecioObj					float,
    Cantidad					int,
    usuarioFK					varchar(50),
    
        CONSTRAINT PK_Historial PRIMARY KEY (id),
	CONSTRAINT FK_UserXHistorial FOREIGN KEY (usuarioFK)
		REFERENCES USUARIO(usuario)
);

DROP TABLE IF EXISTS Domicilio;
CREATE TABLE Domicilio(
	id				int unsigned auto_increment not null,
	usuarioFK		varchar(50),
    Cp				varchar(50),
	Dirección 		varchar(255),
    
		CONSTRAINT PK_Domicilio PRIMARY KEY (id),
	CONSTRAINT FK_UserXDomicilio FOREIGN KEY (usuarioFK)
		REFERENCES USUARIO(usuario)
);

DROP TABLE IF EXISTS Tarjeta;
CREATE TABLE Tarjeta (
	id						int unsigned auto_increment not null,
    UsuarioFK				varchar(50),
    NumeroDeTarjeta			varchar(20),	 
    fechaExpiracion			char(5),
    numeroAtras				varchar(4),
    
        CONSTRAINT PK_Tarjeta PRIMARY KEY (id),
	CONSTRAINT FK_UserXTarjeta FOREIGN KEY (usuarioFK)
		REFERENCES USUARIO(usuario)
);

DROP TABLE IF EXISTS imagenes;
CREATE TABLE imagenes (
	id				int unsigned auto_increment not null,
    imagen			longblob,
	objetoFK		int unsigned,
    
        CONSTRAINT PK_Imagenes PRIMARY KEY (id),
	CONSTRAINT FK_imgXObjeto FOREIGN KEY (objetoFK)
		REFERENCES Objetos(clave)
); 
