import { View, StyleSheet } from "react-native";

export default function HorizontalDivider() {
  return (
    <View style={styles.horizontalRule}/>
  )
}

const styles = StyleSheet.create({
  horizontalRule: {
    borderBottomColor: '#bbb',
    borderBottomWidth: StyleSheet.hairlineWidth,
  },
});