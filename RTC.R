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


# Revisando la posicion 1 de links
links[1]

links[48]
# Revisando cuantos datos tengo
length(links)


# Extrayendo nombre productos 
nombre <-html_nodes(Contenidortc, 'h5')

# Extrayendo texto del nombre 
nombre_producto <- html_text(nombre)

nombre_producto[1]

length(nombre_producto)

# Extrayendo los precios
price <-html_nodes(Contenido,'ins')# Extrayendo texto de precios
precios <- html_text(price)
precios <- gsub(",","", precios)
precios <- gsub("\\$","", precios)


#length(precios)
tablaprecios<-data.frame(producto = nombre_producto, precios = precios)
write.csv(tablaprecios, file = 'tabprecios')

#lista con palabras
unlistproductos<-unlist(nombre_producto)
#Hacer tabla
tablaproductos<-table(unlistproductos)
#unir informacion
dfproductos<-data.frame(tablaproductos)
write.csv(dfproductos, file = 'tabproductos')

