#Pagina Renueva tu closet#

library('rvest')

#Se asigna primera pagina rtc
paginartc <-'https://cl.renuevatucloset.com/categoria-producto/ropa/'

#Leyendo la pagina Renueva tu closet, seccion ropa mujer
webrtc<-read_html(paginartc)

# Leyendo el contenido de la pagina
Contenido <- html_nodes(webrtc,'.product-box')
Contenidortc <- html_nodes(webrtc, '.product-box > a')

# Extrayendo link de cada producto
links <- html_attr(Contenidortc, "href")

# Limpiando los links
links <- gsub("#add_review","",links)

# Eliminando links repetidos
link_producto <- unique (links)

# Revisando la posicion 1 de links
link_producto[1]

link_producto[48]
# Revisando cuantos datos tengo
length(link_producto)

vendedore <- html_nodes(Contenido, 'p')
vendedore_ <- html_text(vendedore)

vendedore_[1]

vendedore_ <- gsub("\t","",vendedore_)
vendedore_ <- gsub("\n","",vendedore_)

 

# Extrayendo nombre productos 
nombre <-html_nodes(Contenidortc, 'h5')

# Extrayendo texto del nombre 
nombre_producto <- html_text(nombre)

nombre_producto[1]

length(nombre_producto)

# Extrayendo los precios
price <-html_nodes(Contenido,'.price')

# Extrayendo texto de precios
precios <- html_text(price)
precios <- gsub(",","", precios)
precios <- gsub("$","", precios)

precios_split <- strsplit(precios,"$")

precios_split <- unique(precios)

length(precios_split)
#lista con palabras
unlistproductos<-unlist(nombre_producto)
#Hacer tabla
tablaproductos<-table(unlistproductos)
#unir informacion
dfproductos<-data.frame(tablaproductos)
#contar frecuencia
nombre_producto<-unique(nombre_producto)
