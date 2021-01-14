package com.example.pressaoarterialapp;

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothManager;
import android.bluetooth.BluetoothDevice;
import android.os.Build.VERSION;
import android.os.Build.VERSION_CODES;
import android.widget.Toast;
import android.Manifest;
import 	android.content.pm.PackageManager;
import java.util.*;
import android.os.Bundle;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "samples.flutter.dev/dispositivo";
    private final static int REQUEST_ENABLE_BT = 1;
    List<Dispositivo> listaDispositivos = new ArrayList();
    List<BluetoothDevice> listaBluetoothDevice = new ArrayList();
    List<Dispositivo> listaDispositivosPareados = new ArrayList();
    BluetoothAdapter bluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
    private MethodChannel.Result myResult;

    // Create a BroadcastReceiver for ACTION_FOUND.
    private final BroadcastReceiver receiver = new BroadcastReceiver() {
        public void onReceive(Context context, Intent intent) {
            String action = intent.getAction();
            System.out.println(action);
            if (BluetoothDevice.ACTION_FOUND.equals(action)) {
                // Discovery has found a device. Get the BluetoothDevice
                // object and its info from the Intent.
                BluetoothDevice device = intent.getParcelableExtra(BluetoothDevice.EXTRA_DEVICE);
               if (device != null) {
                   if (!listaBluetoothDevice.contains(device)) {
                       listaBluetoothDevice.add(device);
                       listaDispositivos.add(new Dispositivo(device.getAddress(),device.getName()));
                   }

               }
            }

            if (BluetoothAdapter.ACTION_DISCOVERY_FINISHED.equals(action)) {
                myResult.success(listaDispositivos.toString());
            }
        }
    };

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
                .setMethodCallHandler(
                        (call, result) -> {
                            myResult = result;

                            if (call.method.equals("getListaDispositivos")) {
                                getDispositivos();
                            } else {
                                if(call.method.equals("getListaDispositivosPareados")) {
                                    Set<BluetoothDevice> original = bluetoothAdapter.getBondedDevices();
                                    listaDispositivosPareados.clear();
                                    for(BluetoothDevice d: original) {
                                        listaDispositivosPareados.add(new Dispositivo(d.getAddress(),d.getName()));
                                    }
                                    result.success(listaDispositivosPareados.toString());
                                }else{
                                    result.notImplemented();
                                }
                            }



                        }

                );
    }

    private void getDispositivos() {
        listaDispositivos.clear();
        if (bluetoothAdapter == null) {
            // Device doesn't support Bluetooth
        }
        if (!bluetoothAdapter.isEnabled()) {
            Intent enableBtIntent = new Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE);
            startActivityForResult(enableBtIntent, REQUEST_ENABLE_BT);
        }
        if (bluetoothAdapter.isDiscovering()) {
            bluetoothAdapter.cancelDiscovery();
        }

        System.out.println(bluetoothAdapter.startDiscovery());
    }


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        if(VERSION.SDK_INT >= VERSION_CODES.M) {
            requestPermissions(new String[]{Manifest.permission.ACCESS_FINE_LOCATION,Manifest.permission.ACCESS_COARSE_LOCATION},1);
        }else{
            Toast toast = Toast.makeText(MainActivity.this, "Permission granted", Toast.LENGTH_SHORT);
            toast.show();
        }


        // Register for broadcasts when a device is discovered.
        IntentFilter filter = new IntentFilter();
        filter.addAction(BluetoothDevice.ACTION_FOUND);
        filter.addAction(BluetoothAdapter.ACTION_DISCOVERY_STARTED);
        filter.addAction(BluetoothAdapter.ACTION_DISCOVERY_FINISHED);
        registerReceiver(receiver, filter);
    }



    @Override
    protected void onDestroy() {
        super.onDestroy();
        // Don't forget to unregister the ACTION_FOUND receiver.
        unregisterReceiver(receiver);
    }


}










 class Dispositivo {
    private String id;
    private String nome;

    public Dispositivo() {

    }

    public Dispositivo(String id, String nome) {
        this.setId(id);
        this.setNome(nome);
    }

    public String getId() {
        return this.id;
    }

    public String getNome() {
        return this.nome;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    @Override
    public String toString() {
        return this.nome + "-" +  this.id;
    }




}