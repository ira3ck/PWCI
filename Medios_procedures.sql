use pokecenter;

DELIMITER //
DROP PROCEDURE IF EXISTS Proc_DML_Carrito;//
CREATE PROCEDURE Proc_DML_Carrito (
	idP					int,
    UsuarioFKP 			varchar(50),
    ObjetoFKP			int,	
    CantidadP			int,
    seleccion			char
)
BEGIN
	if seleccion = 'i' then
		begin
			insert INTO Carrito SET UsuarioFK = UsuarioFKP,
                                    ObjetoFK = ObjetoFKP,
                                    Cantidad = CantidadP;
		end;
	end if;
	if seleccion = 'u' then
		begin
			UPDATE Carrito SET UsuarioFK = ifnull(UsuarioFKP, UsuarioFK),
									ObjetoFK = ifnull(ObjetoFKP, ObjetoFK),
                                    Cantidad = ifnull(CantidadP, Cantidad)
                        where idP = id;	
		end;
	end if;
	if seleccion = 'd' then
		begin
            DELETE FROM Carrito WHERE idP = id;
            
		end;
	end if;
END//
DELIMITER ;

DELIMITER //
DROP PROCEDURE IF EXISTS Proc_DML_Comentario;//
CREATE procedure Proc_DML_Comentario (
	claveP int unsigned,
	textoP text,
	fechaP date,
	respondeA_FKP int unsigned,
	objetoFKP int unsigned,
	usuarioFKP varchar(50),
    seleccion char
)
Begin
	if seleccion = 'i' then
		begin
			insert INTO Comentario SET texto = textoP,
									fecha = now(),
                                    respondeA_FK = respondeA_FKP,
                                    objetoFK = objetoFKP,
                                    usuarioFK = usuarioFKP;
		end;
	end if;
	if seleccion = 'u' then
		begin
			UPDATE Comentario SET texto = ifnull(textoP, texto),
									fecha = ifnull(fechaP, fecha),
                                    respondeA_FK = ifnull(respondeA_FKP, respondeA_FK),
                                    objetoFK = ifnull(objetoFKP, objetoFK),
                                    usuarioFK = ifnull(usuarioFKP, usuarioFK)
                        where claveP = clave;	
		end;
	end if;
	if seleccion = 'd' then
		begin
			DELETE FROM Comentario WHERE claveP = clave;
            DELETE FROM Comentario WHERE respondeA_FKP = claveP;
            
		end;
	end if;
END//

DELIMITER ;

DELIMITER //
DROP PROCEDURE IF EXISTS Proc_DML_Historial;//
CREATE procedure Proc_DML_Historial(
	idP							int unsigned,
    FechaP						date,
    NumeroDeCompraP				int,
	NombreObjP					varchar(100),	
    DescripciónObjP				varchar(255),
    PrecioObjP					int,
    CantidadP					int,
    usuarioFKP					varchar(50),
    seleccion					char    
)
BEGIN
	if seleccion = 'i' then
		begin
			insert INTO Historial SET Fecha = FechaP,
										NumeroDeCompra = NumeroDeCompraP,
										NombreObj = NombreObjP,	
										DescripciónObj = DescripciónObjP,
										PrecioObj = PrecioObjP,
										Cantidad = CantidadP,
										usuarioFK = usuarioFKP;
		end;
	end if;
	if seleccion = 'u' then
		begin
			UPDATE Historial SET Fecha = ifnull(FechaP, Fecha),
										NumeroDeCompra = ifnull(NumeroDeCompraP, NumeroDeCompra),
										NombreObj = ifnull(NombreObjP, NombreObj),	
										DescripciónObj = ifnull(DescripciónObjP, DescripciónObj),
										PrecioObj = ifnull(PrecioObjP, PrecioObj),
										Cantidad = ifnull(CantidadP, Cantidad),
										usuarioFK = ifnull(usuarioFKP,  usuarioFK)
                        where idP = id;	
		end;
	end if;
	if seleccion = 'd' then
		begin
            DELETE FROM Historial WHERE idP = id;
            
		end;
	end if;
END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS Proc_DML_Domicilio;//
CREATE procedure Proc_DML_Domicilio(
	idP				int unsigned,
	usuarioFKP		varchar(50),
    CpP				varchar(50),
	DirecciónP 		varchar(255),
    seleccion		char  
)
BEGIN
	if seleccion = 'i' then
		begin
			insert INTO Domicilio SET usuarioFK	= usuarioFKP,
										Cp = CpP,
										Dirección = DirecciónP;
		end;
	end if;
	if seleccion = 'u' then
		begin
			UPDATE Domicilio SET usuarioFK = ifnull(usuarioFKP, usuarioFK),
									Cp = ifnull(CpP, Cp),
                                    Dirección = ifnull(DirecciónP, Dirección)
                        where idP = id;	
		end;
	end if;
	if seleccion = 'd' then
		begin
            DELETE FROM Domicilio WHERE idP = id;
            
		end;
	end if;
END//
DELIMITER ;

DELIMITER //
DROP PROCEDURE IF EXISTS Proc_DML_Tarjeta;//
CREATE procedure Proc_DML_Tarjeta (
	idP						int unsigned,
    UsuarioFKP				varchar(50),
    NumeroDeTarjetaP			varchar(20),	 
    fechaExpiracionP			date,
    numeroAtrasP				varchar(4),
	seleccion				char
)
BEGIN
	if seleccion = 'i' then
		begin
			insert INTO Tarjeta SET UsuarioFK	= UsuarioFKP,
										NumeroDeTarjeta = NumeroDeTarjetaP,
										fechaExpiracion = fechaExpiracionP,
                                        numeroAtras = numeroAtrasP;
		end;
	end if;
	if seleccion = 'u' then
		begin
			UPDATE Tarjeta SET UsuarioFK = ifnull(UsuarioFKP, UsuarioFK),
									NumeroDeTarjeta = ifnull(NumeroDeTarjetaP, NumeroDeTarjeta),
                                    fechaExpiracion = ifnull(fechaExpiracionP, fechaExpiracion),
                                    numeroAtras = ifnull(numeroAtrasP, numeroAtras)
                        where idP = id;	
		end;
	end if;
	if seleccion = 'd' then
		begin
            DELETE FROM Tarjeta WHERE idP = id;
            
		end;
	end if;
END//
DELIMITER ;

DELIMITER //
DROP PROCEDURE IF EXISTS Proc_DML_imagenes;//
CREATE procedure Proc_DML_imagenes (
	idP				int unsigned,
    imagenP			longblob,
	objetoFKP		int unsigned,
    seleccion		char
)
BEGIN
	if seleccion = 'i' then
		begin
			insert INTO imagenes SET imagen	= UsuarioFKP,
										objetoFK = NumeroDeTarjetaP;
		end;
	end if;
	if seleccion = 'u' then
		begin
			UPDATE imagenes SET imagen = ifnull(imagenP, imagen),
									objetoFK = ifnull(objetoFKP, objetoFK)
                        where idP = id;	
		end;
	end if;
	if seleccion = 'd' then
		begin
            DELETE FROM imagenes WHERE idP = id;
            
		end;
	end if;
END//
DELIMITER ;

DELIMITER //
drop procedure if exists proc_dml_usuario//
CREATE PROCEDURE proc_dml_usuario
(	nombreP				varchar(50),
    apellidoPaternoP	varchar(50),
    apellidoMaternoP	varchar(50),
    telefonoP			varchar(15),
    correoP				varchar(255),
    usuarioP			varchar(50),
    contraseñaP			varchar(30),
    imagenP				longblob,
    generoP				set('Hombre','Mujer','No Binario'),
    Fecha_nacimientoP	date,
    estadoP				char,
    nuevoUsuarioP		varchar(50),
    seleccion			char
    )
    
Begin
	if seleccion = 'i' then
		begin
			insert INTO Usuario SET nombre = nombreP,
									apellidoPaterno = apellidoPaternoP,
                                    apellidoMaterno = apellidoMaternoP,
                                    telefono = telefonoP,
                                    correo = correoP,
                                    usuario = usuarioP,
                                    contraseña = contraseñaP,
                                    imagen = imagenP,
                                    genero = generoP,
                                    Fecha_nacimiento = Fecha_nacimientoP,
                                    estado = estadoP;
		end;
	end if;
	if seleccion = 'u' then
		begin
			UPDATE Usuario SET nombre = ifnull(nombreP, nombre),
						apellidoPaterno = ifnull(apellidoPaternoP, apellidoPaterno),
						apellidoMaterno = ifnull(apellidoMaternoP, apellidoMaterno),
						telefono = ifnull(telefonoP, telefono),
						correo = ifnull(correoP, correo),
						usuario = ifnull(nuevoUsuarioP, usuario),
						contraseña = ifnull(contraseñaP, contraseña),
						imagen = ifnull(imagenP, imagen),
						genero = ifnull(generoP, genero),
						Fecha_nacimiento = ifnull(Fecha_nacimientoP, Fecha_nacimiento),
						estado = ifnull(estado, estadoP)
                        where usuariop = usuario;
			CREATE TEMPORARY TABLE COMENTARIOS_TEM (
					clave int auto_increment not null,
					texto text,
					fecha date,
					respondeA_FK int,
					noticiaFK int unsigned,
					usuarioFK varchar(50)
				);
                
			insert INTO COMENTARIOS_TEM (clave, texto, fecha, respondeA_FK, noticiaFK, usuarioFK) 
            select clave, texto, fecha, respondeA_FK, objetoFK, usuarioFK from COMENTARIO where  usuariop = usuarioFK;
            
            DELETE FROM COMENTARIO WHERE usuariop = usuarioFK;
            
			UPDATE COMENTARIOS_TEM SET usuarioFK = ifnull(nuevoUsuarioP, usuarioFK);
            
			insert INTO COMENTARIOS (clave, texto, fecha, respondeA_FK, noticiaFK, usuarioFK) 
            select clave, texto, fecha, respondeA_FK, noticiaFK, usuarioFK from COMENTARIOS_TEM;
            
            DROP TABLE COMENTARIOS_TEM;
            
			CREATE TEMPORARY TABLE NOTICIAS_TEM (
					código int unsigned auto_increment not null,
					lugar varchar(255),
					fechaNoticia datetime,
					fechaPublicado datetime,
					reporteroFK varchar(50),
					título varchar(255),
					descripción text,
					secciónFK varchar(20),
					estado ENUM('Aprobada', 'Pendiente', 'Rechazada', 'Publicada'),
					comentariosEditor text,
					palabras_clave text,
					likes int unsigned
				);
			
            insert INTO NOTICIAS_TEM (código, lugar, fechaNoticia, fechaPublicado, reporteroFK, título, descripción, secciónFK, estado, comentariosEditor, palabras_clave, likes) 
            select código, lugar, fechaNoticia, fechaPublicado, reporteroFK, título, descripción, secciónFK, estado, comentariosEditor, palabras_clave, likes from NOTICIA where  usuariop = reporteroFK;   

            DELETE FROM NOTICIA WHERE usuariop = reporteroFK;

			UPDATE NOTICIAS_TEM SET reporteroFK = ifnull(nuevoUsuarioP, reporteroFK);

            insert INTO NOTICIA (código, lugar, fechaNoticia, fechaPublicado, reporteroFK, título, descripción, secciónFK, estado, comentariosEditor, palabras_clave, likes) 
            select código, lugar, fechaNoticia, fechaPublicado, reporteroFK, título, descripción, secciónFK, estado, comentariosEditor, palabras_clave, likes from NOTICIAS_TEM;
            
            DROP TABLE NOTICIAS_TEM;
            
		end;
	end if;
	if seleccion = 'd' then
        begin

            DELETE FROM COMENTARIOS WHERE respondeA_FK in (SELECT clave FROM (SELECT clave FROM COMENTARIOS WHERE usuariop = usuarioFK) as CS);

            DELETE FROM COMENTARIOS WHERE usuariop = usuarioFK;

            DELETE FROM COMENTARIOS WHERE noticiaFK = (SELECT código FROM NOTICIA WHERE usuariop = reporteroFK);

            DELETE FROM IMÁGENES WHERE noticiaFK = (SELECT código FROM NOTICIA WHERE usuariop = reporteroFK);

            DELETE FROM textos WHERE noticiaFK = (SELECT código FROM NOTICIA WHERE usuariop = reporteroFK);

            DELETE FROM videos WHERE noticiaFK = (SELECT código FROM NOTICIA WHERE usuariop = reporteroFK);

            DELETE FROM NOTICIA WHERE usuariop = reporteroFK;

            DELETE FROM Usuario WHERE usuariop = usuario;

        end;
    end if;

END//

DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS Proc_DML_listas;//
CREATE procedure Proc_DML_listas (
	claveP			int unsigned,
    usuarioFKP		varchar(50),
    nombreP			varchar(20),
    descripciónP	varchar(100),
    imagenP			longblob,
    publicP			char,
    seleccion		char
)
BEGIN
	IF seleccion = 'I' THEN
		BEGIN
			INSERT INTO Listas
				SET	usuarioFK	= usuarioFKP,
                    nombre		= nombreP,
                    descripción	= descripciónP,
                    imagen		= imagenP,
                    public		= publicP;
		END;
	END IF;
	IF seleccion = 'U' THEN
		BEGIN
			UPDATE Listas
				SET	usuarioFK	= ifnull(usuarioFKP, usuarioFK),
                    nombre		= ifnull(nombreP, nombre),
                    descripción	= ifnull(descripciónP, descripción),
                    imagen		= ifnull(imagenP, imagen),
                    public		= ifnull(publicP, public)
			WHERE clave = claveP;	
		END;
	END if;
	IF seleccion = 'D' THEN
		BEGIN
            DELETE FROM Listas WHERE clave = claveP;
            
		END;
	END IF;
END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS Proc_DML_Sección;//
CREATE procedure Proc_DML_Sección (
	claveP		int unsigned,
    nombreP		varchar(255),
    seleccion	char
)
BEGIN
	IF seleccion = 'I' THEN
		BEGIN
			INSERT INTO Sección
				SET	nombre = ifnull(nombreP, nombre);
		END;
	END IF;
	IF seleccion = 'U' THEN
		BEGIN
			UPDATE Sección
				SET	nombre = nombreP
			WHERE clave = claveP;	
		END;
	END if;
	IF seleccion = 'D' THEN
		BEGIN
            DELETE FROM Sección WHERE clave = claveP;
            
		END;
	END IF;
END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS Proc_DML_Objeto;//
CREATE procedure Proc_DML_Objetos (
	claveP			int unsigned,
    nombreP			varchar(50),
    descripciónP	text,
    precioP			float,
    secciónFKP		int unsigned,
    seleccionP		char
)
BEGIN
	IF seleccion = 'I' THEN
		BEGIN
			INSERT INTO Objetos
				SET	clave 		= claveP,
					nombre 		= nombreP,
					descripción	= descripciónP,
					precio		= precioP,
					secciónFK	= secciónFKP;    
		END;
	END IF;
	IF seleccion = 'U' THEN
		BEGIN
			UPDATE Objetos
				SET	clave 		= ifnull(claveP, clave),
					nombre 		= ifnull(nombreP, nombre),
					descripción	= ifnull(descripciónP, descripción),
					precio		= ifnull(precioP, precio),
					secciónFK	= ifnull(secciónFKP, sección)
			WHERE clave = claveP;	
		END;
	END IF;
	IF seleccion = 'D' THEN
		BEGIN
            DELETE FROM Objetos WHERE clave = claveP;
            
		END;
	END IF;
END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS Proc_DML_listaXobjeto;//
CREATE procedure Proc_DML_listaXobjeto (
	claveP		int unsigned,
    listaFKP		int unsigned,
    objetoFKP	int unsigned,
    seleccionP		char
)
BEGIN
	IF seleccion = 'I' THEN
		BEGIN
			INSERT INTO listaXobjeto
				SET	clave		= claveP,
					listaFK		= listaFKP,
					objetoFK	= objetoFKP;    
		END;
	END IF;
	IF seleccion = 'U' THEN
		BEGIN
			UPDATE listaXobjeto
				SET	clave		= ifnull(claveP, clave),
					listaFK		= ifnull(listaFKP, listaFK),
					objetoFK	= ifnull(objetoFKP, objetoFK)
			WHERE clave = claveP;	
		END;
	END IF;
	IF seleccion = 'D' THEN
		BEGIN
            DELETE FROM listaXobjeto WHERE clave = claveP;
            
		END;
	END IF;
END//
DELIMITER ;

alter table usuario drop imagen;
alter table usuario add imagen longblob;
