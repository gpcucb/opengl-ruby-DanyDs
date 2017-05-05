require 'opengl'
require 'glu'
require 'glut'

include Gl
include Glu
include Glut

# Medidas del cuerpo
BODY_HEIGHT = 4.0
BODY_WIDTH = 2.5
BODY_LENGTH = 1.0
ARM_HEIGHT = 3.5
ARM_WIDTH = 1.0
ARM_LENGTH = 1.0
LEG_HEIGHT = 4.5
LEG_WIDTH = 1.0
LEG_LENGTH = 1.0
HEAD_RADIUS = 1.1


def display
    glDepthFunc(GL_LEQUAL)
    glEnable(GL_DEPTH_TEST)
    
    # Activamos el el Z-Buffer
    glClearColor(0.0,0.0,0.0,0.0)
    glClearDepth(1.0)
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
    
    # Borramos el buffer de color y el Z-Buffer
    glMatrixMode(GL_PROJECTION)
    glLoadIdentity
    gluPerspective(120.0,1.0,1.0,80.0)

    # Proyección perspectiva. El ángulo de visualización es de 60
    #grados, la razón ancho/alto es 1 (son inguales), la distancia
    #mínima es z=1.0, y la distancia máxima es z=100.0
    glMatrixMode(GL_MODELVIEW)
    glTranslatef(0,0,-10.0)            
    glRotatef(-80,3,2,2)
    
    #1er Cubo base
    glPushMatrix    
        glColor3f(1.0,0.1,0.1)
        glutWireCube(2)
    glPopMatrix            
    
    #2do cubo Escalado
    glPushMatrix
        glScalef(3,3,3)
        glColor3f(0.2,1.0,0.1)
        glutWireCube(2)
    glPopMatrix    
    
    #3er cubo Translate
    glPushMatrix               
        glColor3f(0.6,0.7,0.8)
        glTranslatef(0,0,5)
        glutWireCube(3)
    glPopMatrix 
    
    #4to cubo Rotate
    glPushMatrix               
        glColor3f(0.1,1.0,0.8)
        glTranslatef(0,0,5)
        glRotatef(-40,3,2,2)
        glutWireCube(3)
    glPopMatrix    
    
    #5to cubo Combinado
    glPushMatrix       
        glScalef(2,2,2)
        glColor3f(0.1,0.6,0.4)
        glTranslatef(3,2,2.5)
        glRotatef(-50,2,0,0)
        glutWireCube(1)
    glPopMatrix    
    
        
    glFlush
    sleep 20
    exit 0
    
end

glutInit
glutInitDisplayMode(GLUT_SINGLE | GLUT_RGBA | GLUT_DEPTH)    
glutInitWindowSize(500,500)
glutInitWindowPosition(20,20)
glutCreateWindow("Simpleguy, en Ruby")
glutDisplayFunc :display
glutMainLoop