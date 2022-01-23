import { StatusBar } from 'expo-status-bar';
import { StyleSheet, Text, FlatList, SafeAreaView } from 'react-native';
import { useFonts } from 'expo-font';
import Home from './src/components/Home';

export default function App() {
  const [fonts] = useFonts({
    LexendDecaSemiBold: require('./assets/fonts/LexendDeca-SemiBold.ttf'),
    LexendDecaLight: require('./assets/fonts/LexendDeca-Light.ttf'),
    LexendDecaRegular: require('./assets/fonts/LexendDeca-Regular.ttf'),
    LexendDecaMedium: require('./assets/fonts/LexendDeca-Medium.ttf'),
  });

  if (!fonts) {
    return <></>
  }

  return (
    <Home />
  );
}
