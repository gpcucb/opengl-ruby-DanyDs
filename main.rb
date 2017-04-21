require 'opengl'
require 'glu'
require 'glut'

include Gl
include Glu
include Glut

puts ("Hola Mundo")

def display
    #color de fondo de la pantalla
    glClearColor(1.0, 1.0, 1.0, 1.0) 
    
    #Borramos la pantalla
    glClear(GL_COLOR_BUFFER_BIT)
    
    #Modo proyeccion
    glMatrixMode(GL_PROJECTION)
    
    #Cargamos la matriz identidad
    glLoadIdentity
    
    #proyeccion ortografica, detro del cubo señalado
    glOrtho(-1.0,1.0,-1.0,1.0,-1.0,1.0)
    
    #modo de modelado    
    glMatrixMode(GL_MODELVIEW)
    
    glBegin(GL_TRIANGLES)
        glColor3f(1.0,0.8,0.5)
        glVertex3f(0.0,0.8,0.0)
        glColor3f(0.5,0.1,0.2)
        glVertex3f(-0.6,-0.2,0.0)
        glColor3f(0.4,0.3,0.4)
        glVertex3f(0.6,-0.2,0.0)
    glEnd
    glFlush #forzamos el dibujado
    glutPostRedisplay #parar la ejecucion y no se ejecute infinitamente
end

glutInit
glutInitDisplayMode(GLUT_SINGLE | GLUT_RGBA)
glutInitWindowSize(500,500)
glutInitWindowPosition(20,20)
glutCreateWindow("Hola OpenGL, en Ruby")
glutDisplayFunc :display
glutMainLoop