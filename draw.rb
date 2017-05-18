require 'opengl'
require 'glu'
require 'glut'

include Gl
include Glu
include Glut

def display
    glDepthFunc(GL_LEQUAL)
         glEnable(GL_DEPTH_TEST)
    # Activamos el  el Z-Buffer
    glClearColor(0.0,0.0,0.0,0.0)
    glClearDepth(1.0)
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)

    light_1_position = [20.0, 20.0, 30.0]
    light_2_position = [-20.0, -20.0, 50.0]
    color = [1.0,1.0,1.0,1.0]
    color2 = [0.0,1.0,1.0,1.0]
    ambient = [0.2,0.2,0.2,0.1]
    shine = 1.0

    glEnable(GL_LIGHTING)
    glEnable(GL_LIGHT0)
    glEnable(GL_LIGHT1)
    glEnable(GL_COLOR_MATERIAL)
    glColorMaterial(GL_FRONT_AND_BACK, GL_AMBIENT_AND_DIFFUSE)
    glMaterialfv(GL_FRONT, GL_SPECULAR, color)
    glMaterialf(GL_FRONT, GL_SHININESS, shine * 128.0)
    glEnable(GL_NORMALIZE)
    glShadeModel(GL_SMOOTH)
    

    glLightfv(GL_LIGHT0,GL_POSITION,light_1_position)
    glLightfv(GL_LIGHT0,GL_DIFFUSE,color)
    glLightfv(GL_LIGHT0,GL_SPECULAR,color)
    

    glLightModelfv(GL_LIGHT_MODEL_AMBIENT, ambient)
    
    # Borramos el buffer de color y el Z-Buffer
    glMatrixMode(GL_PROJECTION)
    glLoadIdentity()
    gluPerspective(40.0,1.0,1.0,120.0)
    glMatrixMode(GL_MODELVIEW)
    glTranslatef(0.0,0.0,-4.0)

    # Esfera 1
    glPushMatrix()
       glColor3f(1.0,0.8,0.5)
       glTranslatef(0.9,0.9,0)
	   glutSolidSphere(0.9, 50, 50);
    glPopMatrix()

    # Esfera 2
    glPushMatrix()
       glColor3f(0.1,0.2,1.0)
       glTranslatef(0.9,-0.9,0)
	   glutSolidSphere(0.9, 50, 50);
    glPopMatrix()

    # Esfera 3
    glPushMatrix()
       glColor3f(1.0,0.6,1.0)
       glTranslatef(-0.9,-0.9,0)
	   glutSolidSphere(0.9, 50, 50);
    glPopMatrix()

    # Esfera 4
    glPushMatrix()
       glColor3f(0.1,1.0,1.0)
       glTranslatef(-0.9,0.9,0)
	   glutSolidSphere(0.9, 50, 50);
    glPopMatrix()

    glFlush()
end


glutInit
glutInitDisplayMode(GLUT_SINGLE | GLUT_RGBA | GLUT_DEPTH)
glutInitWindowSize(500,500)
glutInitWindowPosition(20,20)
glutCreateWindow("Draw Four Spheres")
glutDisplayFunc :display
glutMainLoop