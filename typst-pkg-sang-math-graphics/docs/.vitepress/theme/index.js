import DefaultTheme from 'vitepress/theme'
import LivePreview from '../components/LivePreview.vue'
import 'katex/dist/katex.min.css'

export default {
    extends: DefaultTheme,
    enhanceApp({ app }) {
        app.component('LivePreview', LivePreview)
    }
}
