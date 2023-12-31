/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package View;
import java.awt.*;
/**
 *
 * @author ACER
 */
public class Menu extends javax.swing.JFrame {

    /**
     * Creates new form Menu
     */
    public Menu() {
        initComponents();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jMenuItem4 = new javax.swing.JMenuItem();
        DP = new javax.swing.JDesktopPane();
        jMenuBar1 = new javax.swing.JMenuBar();
        jMenu1 = new javax.swing.JMenu();
        mnuResetPassword = new javax.swing.JMenuItem();
        jMenuItem1 = new javax.swing.JMenuItem();
        jMenuItem2 = new javax.swing.JMenuItem();
        jMenu2 = new javax.swing.JMenu();
        mnuFindFriend = new javax.swing.JMenuItem();
        mnuCreateRoom = new javax.swing.JMenuItem();
        mnuFindRoom = new javax.swing.JMenuItem();
        mnuFriend = new javax.swing.JMenuItem();
        mnuGroupChat = new javax.swing.JMenuItem();

        jMenuItem4.setText("jMenuItem4");

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        javax.swing.GroupLayout DPLayout = new javax.swing.GroupLayout(DP);
        DP.setLayout(DPLayout);
        DPLayout.setHorizontalGroup(
            DPLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 837, Short.MAX_VALUE)
        );
        DPLayout.setVerticalGroup(
            DPLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 496, Short.MAX_VALUE)
        );

        jMenu1.setText("Hệ Thống");

        mnuResetPassword.setIcon(new javax.swing.ImageIcon(getClass().getResource("/icons/key.png"))); // NOI18N
        mnuResetPassword.setText("Đổi Mật Khẩu");
        mnuResetPassword.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                mnuResetPasswordActionPerformed(evt);
            }
        });
        jMenu1.add(mnuResetPassword);

        jMenuItem1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/icons/logout.png"))); // NOI18N
        jMenuItem1.setText("Đăng Xuất");
        jMenuItem1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem1ActionPerformed(evt);
            }
        });
        jMenu1.add(jMenuItem1);

        jMenuItem2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/icons/exit.png"))); // NOI18N
        jMenuItem2.setText("Thoát");
        jMenuItem2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem2ActionPerformed(evt);
            }
        });
        jMenu1.add(jMenuItem2);

        jMenuBar1.add(jMenu1);

        jMenu2.setText("Thao Tác");

        mnuFindFriend.setIcon(new javax.swing.ImageIcon(getClass().getResource("/icons/find-my-friend.png"))); // NOI18N
        mnuFindFriend.setText("Tìm bạn bè");
        mnuFindFriend.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                mnuFindFriendActionPerformed(evt);
            }
        });
        jMenu2.add(mnuFindFriend);

        mnuCreateRoom.setIcon(new javax.swing.ImageIcon(getClass().getResource("/icons/group.png"))); // NOI18N
        mnuCreateRoom.setText("Tạo Phòng Chat");
        mnuCreateRoom.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                mnuCreateRoomActionPerformed(evt);
            }
        });
        jMenu2.add(mnuCreateRoom);

        mnuFindRoom.setIcon(new javax.swing.ImageIcon(getClass().getResource("/icons/findGroup.png"))); // NOI18N
        mnuFindRoom.setText("Tìm Phòng Chat");
        mnuFindRoom.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                mnuFindRoomActionPerformed(evt);
            }
        });
        jMenu2.add(mnuFindRoom);

        mnuFriend.setIcon(new javax.swing.ImageIcon(getClass().getResource("/icons/friend.png"))); // NOI18N
        mnuFriend.setText("Bạn Bè");
        mnuFriend.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                mnuFriendActionPerformed(evt);
            }
        });
        jMenu2.add(mnuFriend);

        mnuGroupChat.setIcon(new javax.swing.ImageIcon(getClass().getResource("/icons/chat-room.png"))); // NOI18N
        mnuGroupChat.setText("Phòng Chat");
        mnuGroupChat.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                mnuGroupChatActionPerformed(evt);
            }
        });
        jMenu2.add(mnuGroupChat);

        jMenuBar1.add(jMenu2);

        setJMenuBar(jMenuBar1);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(DP)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(DP, javax.swing.GroupLayout.Alignment.TRAILING)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void mnuFindFriendActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_mnuFindFriendActionPerformed
        FindFriend f =new FindFriend();
        f.setVisible(true);
        this.DP.add(f);
        Login.client.AddForm(f);
        // TODO add your handling code here:
    }//GEN-LAST:event_mnuFindFriendActionPerformed

    private void mnuCreateRoomActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_mnuCreateRoomActionPerformed

        CreateGroupChat f1 =new CreateGroupChat();
        f1.setVisible(true);
        this.DP.add(f1);
        Login.client.AddForm(f1);
        // TODO add your handling code here:
    }//GEN-LAST:event_mnuCreateRoomActionPerformed

    private void mnuFindRoomActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_mnuFindRoomActionPerformed

        FindGroupChat f2 =new FindGroupChat();
        f2.setVisible(true);
        this.DP.add(f2);
        Login.client.AddForm(f2);
        // TODO add your handling code here:
    }//GEN-LAST:event_mnuFindRoomActionPerformed

    private void mnuFriendActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_mnuFriendActionPerformed

        FriendForm f3 =new FriendForm();
        f3.setVisible(true);
        this.DP.add(f3);
        Login.client.AddForm(f3);
        // TODO add your handling code here:
    }//GEN-LAST:event_mnuFriendActionPerformed

    private void mnuGroupChatActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_mnuGroupChatActionPerformed

        GroupForm f4 =new GroupForm();
        f4.setVisible(true);
        this.DP.add(f4);
        Login.client.AddForm(f4);
        // TODO add your handling code here:
    }//GEN-LAST:event_mnuGroupChatActionPerformed

    private void jMenuItem2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem2ActionPerformed
        System.exit(0);
        // TODO add your handling code here:
    }//GEN-LAST:event_jMenuItem2ActionPerformed

    private void jMenuItem1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem1ActionPerformed
        String msg = "logout///"+Login.client.NickName+"///"+"SERVER";
        Login.client.send(msg);
        Login.client.AddForm(this);
        // TODO add your handling code here:
    }//GEN-LAST:event_jMenuItem1ActionPerformed

    private void mnuResetPasswordActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_mnuResetPasswordActionPerformed
        new CreatePassword().setVisible(true);
        // TODO add your handling code here:
    }//GEN-LAST:event_mnuResetPasswordActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(Menu.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Menu.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Menu.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Menu.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Menu().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JDesktopPane DP;
    private javax.swing.JMenu jMenu1;
    private javax.swing.JMenu jMenu2;
    private javax.swing.JMenuBar jMenuBar1;
    private javax.swing.JMenuItem jMenuItem1;
    private javax.swing.JMenuItem jMenuItem2;
    private javax.swing.JMenuItem jMenuItem4;
    private javax.swing.JMenuItem mnuCreateRoom;
    private javax.swing.JMenuItem mnuFindFriend;
    private javax.swing.JMenuItem mnuFindRoom;
    private javax.swing.JMenuItem mnuFriend;
    private javax.swing.JMenuItem mnuGroupChat;
    private javax.swing.JMenuItem mnuResetPassword;
    // End of variables declaration//GEN-END:variables
}
