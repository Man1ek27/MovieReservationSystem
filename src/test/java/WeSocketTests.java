import org.java_websocket.client.WebSocketClient;
import org.java_websocket.handshake.ServerHandshake;
import org.junit.jupiter.api.*;
import server.MovieReservationWebSocketServer;

import java.net.URI;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

import static org.junit.jupiter.api
        .Assertions.*;

class MovieReservationWebSocketServerTest {
    static MovieReservationWebSocketServer server;
    static final int PORT = 9999;

    @BeforeAll
    static void startServer() throws Exception {
        server = new MovieReservationWebSocketServer(PORT);
        server.start();
        // Poczekaj chwilę aż serwer się uruchomi
        Thread.sleep(1000);
    }

    @AfterAll
    static void stopServer() throws Exception {
        server.stop();
    }

    @Test
    void testLoginSuccess() throws Exception {
        CountDownLatch latch = new CountDownLatch(1);
        String[] response = new String[1];

        WebSocketClient client = new WebSocketClient(new URI("ws://localhost:" + PORT)) {
            private boolean loginSent = false;
            @Override
            public void onOpen(ServerHandshake handshakedata) {
                // Nic nie wysyłaj od razu, poczekaj na powitanie
            }
            @Override
            public void onMessage(String message) {
                if (!loginSent && message.startsWith("Welcome")) {
                    // Otrzymaliśmy powitanie, teraz wysyłamy LOGIN
                    this.send("LOGIN:admin:123qwe");
                    loginSent = true;
                } else {
                    // Otrzymaliśmy odpowiedź na LOGIN
                    response[0] = message;
                    latch.countDown();
                }
            }
            @Override
            public void onClose(int code, String reason, boolean remote) {}
            @Override
            public void onError(Exception ex) {}
        };
        client.connectBlocking();
        assertTrue(client.isOpen(), "Client should be connected");

        boolean received = latch.await(3, TimeUnit.SECONDS);
        assertTrue(received, "Server should respond within 3 seconds");

        assertNotNull(response[0]);
        assertTrue(response[0].startsWith("LOGIN_SUCCESS:") || response[0].startsWith("LOGIN_FAILED:"), "Unexpected response: " + response[0]);
        client.close();
    }

}
